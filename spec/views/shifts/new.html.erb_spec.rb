require 'rails_helper'

RSpec.describe "shifts/new", type: :view do
  before(:each) do
    assign(:shift, Shift.new(
      weekday: 1,
      start_time: 1,
      end_time: 1
    ))
  end

  it "renders new shift form" do
    render

    assert_select "form[action=?][method=?]", shifts_path, "post" do

      assert_select "input[name=?]", "shift[weekday]"

      assert_select "input[name=?]", "shift[start_time]"

      assert_select "input[name=?]", "shift[end_time]"
    end
  end
end
