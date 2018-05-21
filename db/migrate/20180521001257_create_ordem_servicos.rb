class CreateOrdemServicos < ActiveRecord::Migration[5.1]
  def change
    create_table :ordem_servicos do |t|
      t.string :orcamento #, foreign_key: true
      t.decimal :valor_total, precision: 10, scale: 2
      t.text :descricao_servico
      t.text :observacao
      t.date :data_criacao
      t.string :garantia
      t.boolean :status_pagamento

      t.timestamps
    end
  end
end
