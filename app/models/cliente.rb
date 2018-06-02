class Cliente < Terceiro
  belongs_to :terceiro
  has_many :veiculos
  
  validates :terceiro, presence: true
end
