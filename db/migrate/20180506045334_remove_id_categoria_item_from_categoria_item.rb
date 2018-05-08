class RemoveIdCategoriaItemFromCategoriaItem < ActiveRecord::Migration[5.1]
  def change
    remove_column :categoria_items, :id_categoria_item, :integer
  end
end
