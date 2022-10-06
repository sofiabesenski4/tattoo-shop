class Shift < ApplicationRecord
  validates :start_time_before_end_time
  enum(:weekday, [ "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday" ])


  def start_time_before_end_time
    return if start_time < end_time

    errors.add(:start_time, "Start time must be before end time. No overnight shifts!!!!")
  end
end
