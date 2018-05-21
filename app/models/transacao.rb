class Transacao < ApplicationRecord
  self.table_name = 'transacoes' 
  
  # belongs_to :ordem_servico
  # belongs_to :funcionario
end
