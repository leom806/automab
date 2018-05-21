class CreateOrcamentoItems < ActiveRecord::Migration[5.1]
  def change
    create_table :orcamento_items do |t|
      t.references :orcamento, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :quantidade

      t.timestamps
    end
  end
end
