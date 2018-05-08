class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :codigoFabricante
      t.string :nomeItem
      t.string :descricao
      t.date :validade
      t.decimal :preco, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
