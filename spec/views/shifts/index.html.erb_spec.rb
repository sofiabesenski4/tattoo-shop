require 'rails_helper'

RSpec.describe "shifts/index", type: :view do
  before(:each) do
    assign(:shifts, [
      Shift.create!(
        weekday: 2,
        start_time: 3,
        end_time: 4
      ),
      Shift.create!(
        weekday: 2,
        start_time: 3,
        end_time: 4
      )
    ])
  end

  it "renders a list of shifts" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
  end
end
