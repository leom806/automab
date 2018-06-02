class CreateEnderecos < ActiveRecord::Migration[5.1]
  def change
    create_table :enderecos do |t|
      t.string :cep
      t.string :logradouro
      t.string :numero
      t.string :complemento
      t.string :bairro
      t.string :cidade
      t.string :uf
      t.string :telefone
      t.string :celular
      t.string :email
      t.string :website

      t.timestamps
    end
  end
end
