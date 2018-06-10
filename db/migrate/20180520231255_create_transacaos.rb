class CreateTransacaos < ActiveRecord::Migration[5.1]
  def change
    create_table :transacaos do |t|
      t.date :data_transacao
      t.decimal :valor_recebido, :precision => 10, :scale => 2
      t.string :forma_pagamento
      t.references :ordem_servico
      t.references :funcionario  

      t.timestamps
    end
  end
end
