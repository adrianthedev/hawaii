# == Schema Information
#
# Table name: properties
#
#  id          :bigint           not null, primary key
#  address     :string
#  coordinates :string
#  name        :string
#  position    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  island_id   :bigint           not null
#  user_id     :bigint
#
# Indexes
#
#  index_properties_on_island_id  (island_id)
#  index_properties_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (island_id => islands.id)
#  fk_rails_...  (user_id => users.id)
#
class Property < ApplicationRecord
  belongs_to :island
  belongs_to :user, optional: true

  has_one_attached :photo
  has_many_attached :photos
  has_many :bookings

  acts_as_list
end
