class Cliente < ApplicationRecord
  belongs_to :terceiro
  belongs_to :veiculo
end
