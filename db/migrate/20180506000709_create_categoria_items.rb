class CreateCategoriaItems < ActiveRecord::Migration[5.1]
  def change
    create_table :categoria_items do |t|
      t.integer :id_categoria_item
      t.string :descricao

      t.timestamps
    end
  end
end
