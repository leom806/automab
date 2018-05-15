class CreateCargos < ActiveRecord::Migration[5.1]
  def change
    create_table :cargos do |t|
      t.string :nome
      t.float :salario
      t.text :descricao

      t.timestamps
    end
  end
end
