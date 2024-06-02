class RemoveShifts < ActiveRecord::Migration[7.0]
  def change
    drop_table :shifts
  end
end
