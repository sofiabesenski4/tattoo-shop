module VariantDecorator
  extend ActiveSupport::Concern


  def shipping_category_id
      product_shipping_category_id
  end

  Spree::Variant.prepend self
end

