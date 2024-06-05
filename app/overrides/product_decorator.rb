module ProductDecorator
  extend ActiveSupport::Concern


  Spree::Product.prepend(self)
end
