require "feature_helper"

RSpec.feature "Booking an Appointment" do
  before do
    # Init appointment product.
    Spree::Product.appointment
  end

  it "doesn't blow up immediately" do
    visit "/products/appointment"

    select "2099-01-01 13:00", from: "Openings"
  end
end

