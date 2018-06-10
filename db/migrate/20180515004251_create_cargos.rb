class CreateCargos < ActiveRecord::Migration[5.1]
  def change
    create_table :cargos do |t|
      t.string :nome
      t.float :salario, precision: 8, scale: 2
      t.text :descricao

      t.timestamps
    end
  end
end
