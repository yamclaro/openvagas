class Position < ApplicationRecord
  belongs_to :company
  belongs_to :career
  belongs_to :position_type

  has_rich_text :description

  validates :name, :career, :position_type, :city, :state,  presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[name company_name] # Liste os atributos que você quer que sejam pesquisáveis
  end

  # Permite associações pesquisáveis
  def self.ransackable_associations(auth_object = nil)
  %w[career]
  end
end
