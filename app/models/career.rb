class Career < ApplicationRecord
   has_many :positions

   def self.ransackable_attributes(auth_object = nil)
      %w[created_at description id name updated_at] # Adicione os atributos que você deseja permitir
    end
  
    def self.ransackable_associations(auth_object = nil)
      [] # Adicione associações, se necessário
    end
end
