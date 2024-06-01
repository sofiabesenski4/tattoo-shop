module ProductDecorator
  extend ActiveSupport::Concern

  class_methods do
    def appointment
      Spree::Product.find_by!(slug: "appointment")
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
