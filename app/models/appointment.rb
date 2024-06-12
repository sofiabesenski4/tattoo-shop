class Appointment < ApplicationRecord
  include Spree::SoftDeletable

  # Use for checking whether this appointment has been deleted. Provided for
  # overriding the logic for determining if a appointment is deleted.
  #
  # @return [Boolean] true if this appointment is deleted
  def deleted?
    !!deleted_at
  end
end
