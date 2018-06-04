class CreateTerceiros < ActiveRecord::Migration[5.1]
  def change
    create_table :terceiros do |t|
      t.boolean :juridica
      t.string :inscricao_municipal
      t.string :inscricao_estadual
      t.string :cpf
      t.string :nome_fantasia
      t.string :cnpj
      t.date :data_ultima_alteracao
      t.date :data_cadastro
      t.string :rg
      t.date :data_nascimento
      t.string :nome_completo
      t.string :type

      t.timestamps
    end
  end
end
