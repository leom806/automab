class AddClienteToVeiculo < ActiveRecord::Migration[5.1]
  def change
    add_reference :veiculos, :cliente, index: true
  end
end
