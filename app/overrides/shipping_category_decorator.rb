module ShippingCategoryDecorator
  extend ActiveSupport::Concern

  class_methods do
    def default
      Spree::ShippingCategory.find_or_create_by(name: "default")
    end
  end

  Spree::ShippingCategory.prepend(self)
end

