require 'rails_helper'

# FIXME: Skipping these specs for now.
RSpec.describe "/shifts", type: :request do

  pending
  # This should return the minimal set of attributes required to create a valid
  # Shift. As you add validations to Shift, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      weekday: 1,
      start_time: 9,
      end_time: 17
    }
  }

  let(:invalid_attributes) {
    {
      weekday: 1,
      start_time: 3,
      end_time: 2
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Shift.create! valid_attributes
      get shifts_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      shift = Shift.create! valid_attributes
      get shift_url(shift)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_shift_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      shift = Shift.create! valid_attributes
      get edit_shift_url(shift)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Shift" do
        expect {
          post shifts_url, params: { shift: valid_attributes }
        }.to change(Shift, :count).by(1)
      end

      it "redirects to the created shift" do
        post shifts_url, params: { shift: valid_attributes }
        expect(response).to redirect_to(shift_url(Shift.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Shift" do
        expect {
          post shifts_url, params: { shift: invalid_attributes }
        }.to change(Shift, :count).by(0)
      end

      xit "renders a successful response (i.e. to display the 'new' template)" do
        post shifts_url, params: { shift: invalid_attributes }
        binding.pry
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          end_time: 23
        }
      }

      it "updates the requested shift" do
        shift = Shift.create! valid_attributes
        patch shift_url(shift), params: { shift: new_attributes }
        shift.reload

        expect(shift).end_time to_eq 23
      end

      it "redirects to the shift" do
        shift = Shift.create! valid_attributes
        patch shift_url(shift), params: { shift: new_attributes }
        shift.reload
        expect(response).to redirect_to(shift_url(shift))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        shift = Shift.create! valid_attributes
        patch shift_url(shift), params: { shift: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested shift" do
      shift = Shift.create! valid_attributes
      expect {
        delete shift_url(shift)
      }.to change(Shift, :count).by(-1)
    end

    it "redirects to the shifts list" do
      shift = Shift.create! valid_attributes
      delete shift_url(shift)
      expect(response).to redirect_to(shifts_url)
    end
  end
end
