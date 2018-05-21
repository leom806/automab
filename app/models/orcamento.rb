class Orcamento < ApplicationRecord
  
  # Funcionário
  # Agendamento
  # Cliente
  # Serviço Concluído
  # Veículo
  
  # has_one :funcionario
  # has_one :agendamento
  # has_one :cliente
  # has_one :veiculo

  validates :funcionario, :agendamento, :cliente, :veiculo, :servico_concluido, presence: true

end
