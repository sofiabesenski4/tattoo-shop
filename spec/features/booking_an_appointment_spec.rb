# frozen_string_literal: true

require "feature_helper"

RSpec.feature "Booking an Appointment", js: true do
  before do
    create :store
    create(:product, slug: "appointment", bookable: true)
  end

  it "creates an appointment when the user adds a bookable product to their cart" do
    visit "/products/appointment"

    expect(page).to have_content /Start Time/i

    fill_in "order_appointment_start_time", with: DateTime.current

    fill_in "order_appointment_end_time", with: 3.hours.from_now

    click_button "Add To Cart"

    expect(Appointment.count).to eq 1
  end
end

