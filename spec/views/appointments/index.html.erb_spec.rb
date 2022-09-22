require 'rails_helper'

RSpec.describe "appointments/index", type: :view do
  before(:each) do
    assign(:appointments, [
      Appointment.create!(
        name: "Name"
      ),
      Appointment.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of appointments" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
