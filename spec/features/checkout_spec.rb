# frozen_string_literal: true

require "feature_helper"

RSpec.feature "Checkout", js: true do
  before do
    create :store
    create(:product, slug: "appointment", bookable: true)
    create(:product, slug: "sticker", bookable: false)
  end

  scenario "a user checking out" do
    visit "/products/appointment"

    expect(page).to have_content /Start Time/i

    fill_in "order_appointment_start_time", with: DateTime.current
    fill_in "order_appointment_end_time", with: 3.hours.from_now

    click_button "Add To Cart"

    visit "/products/sticker"
    click_button "Add To Cart"

    click_button "Checkout"

    within("#guest_checkout") do
      fill_in "Email", with: "sofia@example.com"

      click_button "Continue"
    end

    fill_in "Name", with: "Sof"

    fill_in "Street Address", with: "123 Main St", id: "order_bill_address_attributes_address1"
    fill_in "City", with: "Townsville", id: "order_bill_address_attributes_city"
    select "Alabama", from: "State"
    fill_in "Zip", with: "90210", id: "order_bill_address_attributes_zipcode"
    fill_in "Phone", with: "1234567890", id: "order_bill_address_attributes_phone"

    click_button "Save and Continue"

    # Use default shipping methods.
    #
    expect(current_url).to include("delivery"), pending: "TODO: Create shipping rates in the test setup"
  end
end


