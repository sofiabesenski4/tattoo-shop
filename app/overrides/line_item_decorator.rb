module LineItemDecorator
  extend ActiveSupport::Concern
  prepended do
    belongs_to :appointment, optional: true

    accepts_nested_attributes_for :appointment
  end

  Spree::LineItem.prepend self
end
