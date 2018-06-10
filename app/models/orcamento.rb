class Orcamento < ApplicationRecord
  
  alias_attribute :linhas, :orcamento_items

  belongs_to :funcionario
  belongs_to :agendamento
  belongs_to :cliente
  belongs_to :veiculo
  has_many :orcamento_items, dependent: :delete_all

  validates :funcionario_id, :agendamento_id, :cliente_id, :veiculo_id, presence: true

end
