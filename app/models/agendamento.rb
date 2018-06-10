class Agendamento < ApplicationRecord
  
  has_one :funcionario

  validates :data_solicitacao, :data_agendamento, :funcionario_id, presence: true     

  validate :validade_in_the_future

  def validade_in_the_future
    errors.add(:data_agendamento, "A data deve ser posterior ou igual a data de solicitação.") if data_agendamento >= data_solicitacao 
  end

end
