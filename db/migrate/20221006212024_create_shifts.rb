class CreateShifts < ActiveRecord::Migration[7.0]
  def change
    create_table :shifts do |t|
      t.integer :weekday, null: false
      t.integer :start_time, null: false, default: 9
      t.integer :end_time, null: false, default: 17
      t.references :spree_users

      t.timestamps
    end
  end
end
