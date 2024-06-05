module LineItemDecorator
  extend ActiveSupport::Concern
  prepended do
    belongs_to :appointment, optional: true
  end

  Spree::LineItem.prepend self
end
