class Cliente < Terceiro
  belongs_to :terceiro
  belongs_to :veiculo
  
  validates :terceiro, :veiculo, presence: true
end
