# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)

digital_shipping_category = Spree::ShippingCategory.create!(name: "Digital")

duration_option_type = Spree::OptionType.create!(name: "duration", presentation: "Duration (min)")

tattoo_time = Spree::Product.create!(
  slug: "tattoo-time",
  shipping_category: digital_shipping_category,
  name: "Tattoo Time",
  available_on: Date.yesterday,
  option_types: [duration_option_type])

(2..6).each do |index|
  minutes = index * 30

  duration_option_value = Spree::OptionValue.create!(
    name: "#{minutes}",
    presentation: "#{minutes}",
    option_type: duration_option_type
  )

  variant = Spree::Variant.create!(
    product: tattoo_time,
    sku: "TATTOO-#{minutes}",
    shipping_category: digital_shipping_category,
    option_values: [duration_option_value],
    prices: []
  )

  # This ends up being $120/hr
  Spree::Price.create!(
    variant: variant,
    amount: (2 * minutes).to_f,
    currency: "CAD",
    country_iso: "CA"
  )

end


flat_rate_shipping_calculator = Spree::Calculator::Shipping::FlatPercentItemTotal.create(
  type: "Spree::Calculator::Shipping::FlatPercentItemTotal",
  calculable_type: "Spree::ShippingMethod",
  preferences: {:flat_percent=>0.0}
)

Spree::ShippingMethod.create!(
  name: "Digital",
  code: "DIGITAL",
  zones: Spree::Zone.all,
  shipping_categories: Spree::ShippingCategory.all,
  calculator: flat_rate_shipping_calculator)

# Replace this with an E-Transfer Payment Method
Spree::PaymentMethod.find_or_create_by(
  type: "Spree::PaymentMethod::Check",
  name: "Bank Transfer & Check",
  auto_capture: false,
  active: true,
  available_to_users: true,
  available_to_admin: true)
