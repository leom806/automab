class Cliente < ApplicationRecord
  has_many :veiculos
  
  # validates :terceiro, presence: true
end
