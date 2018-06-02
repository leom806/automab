class AddClienteToVeiculo < ActiveRecord::Migration[5.1]
  def change
    add_reference :veiculos, :cliente, foreign_key: true
  end
end
