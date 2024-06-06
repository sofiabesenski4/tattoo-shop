class Spree::Admin::AppointmentsController < Spree::Admin::ResourceController
  def index
    params[:q] ||= {}
    params[:page] ||= 1

    @collection = ::Appointment.all
    # TODO: Add params here.
    @search = ::Appointment.ransack()
  end

  private

  def model_class
    Appointment
  end
end
