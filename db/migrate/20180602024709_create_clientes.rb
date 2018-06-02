class CreateClientes < ActiveRecord::Migration[5.1]
  def change
    create_table :clientes do |t|
      t.references :terceiro, foreign_key: true
      t.references :veiculo, foreign_key: true

      t.timestamps
    end
  end
end
