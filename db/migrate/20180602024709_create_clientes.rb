class CreateClientes < ActiveRecord::Migration[5.1]
  def change
    create_table :clientes do |t|

      t.timestamps
    end
  end
end
