class Terceiro < ApplicationRecord
  has_one :endereco

  validates :type, presence: true
  validates :inscricao_municipal, :inscricao_estadual, :nome_fantasia, :cnpj, presence: true, if: :is_third_party?
  validates :nome_completo, :rg, :cpf, :data_nascimento, presence: true, if: :is_not_third_party?
  validates :rg, length: { is: 9 }, if: :is_not_third_party?
  validates :cpf, length: { is: 11 }, if: :is_not_third_party?
  validates :cnpj, length: { is: 14 }, if: :is_third_party?
  validates :inscricao_estadual, :inscricao_municipal, length: { is: 12 }, if: :is_third_party?

  def is_third_party?
    juridica == true
  end

  def is_not_third_party?
    juridica == false
  end
end
