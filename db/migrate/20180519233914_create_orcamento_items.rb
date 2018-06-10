class CreateOrcamentoItems < ActiveRecord::Migration[5.1]
  def change
    create_table :orcamento_items do |t|
      t.references :orcamento, index: true
      t.references :item, index: true
      t.integer :quantidade

      t.timestamps
    end
  end
end
