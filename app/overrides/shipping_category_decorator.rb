module ShippingCategoryDecorator
  extend ActiveSupport::Concern

  class_methods do
    def digital
      Spree::ShippingCategory.find_or_create_by(code: "DIGITAL")
    end
  end

  Spree::ShippingCategory.prepend(self)
end

