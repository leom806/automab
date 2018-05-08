class AddCategoriaItemToItem < ActiveRecord::Migration[5.1]
  def change
    add_reference :items, :categoria_item, foreign_key: true
  end
end