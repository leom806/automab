class Transacao < ApplicationRecord  
  belongs_to :ordem_servico
  belongs_to :funcionario
end
