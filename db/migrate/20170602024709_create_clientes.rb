class CreateClientes < ActiveRecord::Migration[5.1]
  def change
    create_table :clientes do |t|

      # Genérico para Terceiro
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

      # Específico do Cliente
      t.references :veiculo, index: true

      t.timestamps
    end
  end
end
