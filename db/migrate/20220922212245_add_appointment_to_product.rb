class AddAppointmentToProduct < ActiveRecord::Migration[7.0]
  def change
    add_reference :spree_products, :appointments
  end
end
