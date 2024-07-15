class Position < ApplicationRecord
  belongs_to :company
  belongs_to :career
  belongs_to :position_type

  has_rich_text :description

  validates :name, :career, :position_type, :city, :state,  presence: true
end
