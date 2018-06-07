class CreateFuncionarios < ActiveRecord::Migration[5.1]
  def change
    create_table :funcionarios do |t|
      t.boolean :status_pagamento

      t.timestamps
    end
  end
end
