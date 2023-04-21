class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :property

  def name
    "#{visitor} - #{visit_at}"
  end
end
