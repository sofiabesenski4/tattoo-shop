class CreateShifts < ActiveRecord::Migration[7.0]
  def change
    create_table :shifts do |t|
      t.integer :weekday
      t.integer :start_time
      t.integer :end_time

      t.timestamps
    end
  end
end
