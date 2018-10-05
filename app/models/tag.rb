# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ApplicationRecord
	has_and_belongs_to_many :activities
	scope :by_titule, -> { order(:titule) }

  validates :tituñe, presence: true, uniqueness: true
end
