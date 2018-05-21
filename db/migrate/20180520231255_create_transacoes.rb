class CreateTransacoes < ActiveRecord::Migration[5.1]
  def change
    create_table :transacoes do |t|
      t.string :ordem_servico #, foreign_key: true
      t.string :funcionario   #, foreign_key: true
      t.date :data_transacao
      t.decimal :valor_recebido, :precision => 10, :scale => 2
      t.string :forma_pagamento

      t.timestamps
    end
  end
end
