class Terceiro < ApplicationRecord
  # t.boolean :juridica
  # t.string :inscricao_municipal
  # t.string :inscricao_estadual
  # t.string :cpf
  # t.string :nome_fantasia
  # t.string :cnpj
  # t.date :data_ultima_alteracao
  # t.string :tipo_terceiro
  # t.date :data_cadastro
  # t.string :rg
  # t.date :data_nascimento
  # t.string :nome_completo

  validates :juridica, :tipo_terceiro, presence: true
  validates :inscricao_municipal, :inscricao_estadual :nome_fantasia, :cnpj, :presence => true, :if is_third_party?
  validates :nome_completo, :rg, :cpf, :data_nascimento, :presence => true, :if !is_third_party?
  validates :rg, length: { is: 9 }
  validates :cpf, length: { is: 11 }
  validates :cnpj, length: { is: 14 }
  validates :inscricao_estadual, :inscricao_municipal, length: { is: 12 }

  def is_third_party?
    (juridica == true)
  end
end