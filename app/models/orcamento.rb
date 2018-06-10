class Orcamento < ApplicationRecord
  
  belongs_to :funcionario
  belongs_to :agendamento
  belongs_to :cliente
  belongs_to :veiculo

  validates :funcionario, :agendamento, :cliente, :veiculo, presence: true

end
