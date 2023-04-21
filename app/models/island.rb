# == Schema Information
#
# Table name: islands
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Island < ApplicationRecord
  has_one_attached :photo
  has_and_belongs_to_many :users
end
