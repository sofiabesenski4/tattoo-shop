module ProductDecorator
  extend ActiveSupport::Concern

  class_methods do
    def appointment
      Spree::Product.find_or_create_by(slug: "appointment") do |p|
        p.shipping_category = Spree::ShippingCategory.default
        p.name = "Appointment"
        p.price = 99
        p.available_on = Date.yesterday
      end
    end
  end

  def availability
    [
      "2099-01-01 15:00",
      "2099-01-01 13:00"
    ]
  end


  Spree::Product.prepend(self)
end
