class ChangeAppointmentAssociation < ActiveRecord::Migration[7.0]
  def change
    remove_reference :spree_products, :appointments

    add_reference :spree_line_items, :appointments
  end
end
