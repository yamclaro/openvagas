class Position < ApplicationRecord
  belongs_to :company
  belongs_to :career
  belongs_to :position_type

  validates :name, :career, :position_type, :city, :state,  presence: true
end
