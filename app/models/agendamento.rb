class Agendamento < ApplicationRecord
  
  # Funcionário
  # Data de Solicitação
  # Data Agendada
  # Entrega Estimada
  # Descrição
  
  has_one :funcionario

  validates :data_solicitacao, :data_agendada, :funcionario, presence: true     

  validate :validade_in_the_future

  def validade_in_the_future
    if data_agendada.present? && data_agendada > data_solicitacao
      errors.add(:data_agendada, "A data deve ser posterior a data de solicitação.")
    end
  end

end
