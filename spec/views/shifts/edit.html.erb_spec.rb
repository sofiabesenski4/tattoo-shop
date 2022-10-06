require 'rails_helper'

RSpec.describe "shifts/edit", type: :view do
  before(:each) do
    @shift = assign(:shift, Shift.create!(
      weekday: 1,
      start_time: 1,
      end_time: 1
    ))
  end

  it "renders the edit shift form" do
    render

    assert_select "form[action=?][method=?]", shift_path(@shift), "post" do

      assert_select "input[name=?]", "shift[weekday]"

      assert_select "input[name=?]", "shift[start_time]"

      assert_select "input[name=?]", "shift[end_time]"
    end
  end
end
