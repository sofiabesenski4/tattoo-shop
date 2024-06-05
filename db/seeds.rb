# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)


Spree::User.find_or_create_by(email: "admin@example.com") do |admin|
  admin.password = "test123"
end


digital_shipping_category = Spree::ShippingCategory.create!(name: "Digital")

duration_option_type = Spree::OptionType.find_or_create_by(name: "duration", presentation: "Duration (min)")

tattoo_time = Spree::Product.find_or_create_by(
  slug: "tattoo-time",
  shipping_category: digital_shipping_category,
  name: "Tattoo Time",
  available_on: Date.yesterday
) do |product|
  product.price = 120
  product.option_types = [duration_option_type]
end

(2..6).each do |index|
  minutes = index * 30

  duration_option_value = Spree::OptionValue.find_or_create_by!(
    name: "#{minutes}",
    presentation: "#{minutes}",
    option_type: duration_option_type
  )

  variant = Spree::Variant.find_or_create_by(
    sku: "TATTOO-#{minutes}"
  ) do |v|
    v.shipping_category = digital_shipping_category
    v.prices = []
    v.option_values = [duration_option_value]
    v.product = tattoo_time
  end

  # This ends up being $120/hr
  Spree::Price.find_or_create_by(
    variant: variant,
    amount: (2 * minutes).to_f,
    currency: "CAD",
  )

end


flat_rate_shipping_calculator = Spree::Calculator::Shipping::FlatPercentItemTotal.find_or_create_by(
  type: "Spree::Calculator::Shipping::FlatPercentItemTotal",
  calculable_type: "Spree::ShippingMethod",
  preferences: {:flat_percent=>0.0}
)

Spree::ShippingMethod.find_or_create_by(
  name: "Digital",
  code: "DIGITAL",
  calculator: flat_rate_shipping_calculator
) do |sm|
  sm.zones = Spree::Zone.all
  sm.shipping_categories = Spree::ShippingCategory.all
end

# Replace this with an E-Transfer Payment Method
Spree::PaymentMethod.find_or_create_by(
  type: "Spree::PaymentMethod::Check",
  name: "Bank Transfer & Check",
  auto_capture: false,
  active: true,
  available_to_users: true,
  available_to_admin: true)
