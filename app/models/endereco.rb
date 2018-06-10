class Endereco < ApplicationRecord  
  validates :cep, :logradouro, :bairro, :cidade, presence: true
  
  validate :existe_ao_menos_um_terceiro
  
  def existe_ao_menos_um_terceiro
    errors.add('Sem terceiro informado.') unless cliente_id.present? || funcionario_id.present?
  end
end
