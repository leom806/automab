class CreateCategoriaItems < ActiveRecord::Migration[5.1]
  def change
    create_table :categoria_items do |t|      
      t.string :descricao

      t.timestamps
    end
  end
end
