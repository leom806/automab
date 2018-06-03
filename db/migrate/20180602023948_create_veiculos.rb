class CreateVeiculos < ActiveRecord::Migration[5.1]
  def change
    create_table :veiculos do |t|
      t.string  :montadora
      t.string  :modelo
      t.string  :versao
      t.string  :placa
      t.string  :chassi
      t.string  :combustivel
      t.string  :cor
      t.integer :ano_modelo
      t.integer :ano_fabricacao
      t.integer :quilometragem

      t.timestamps
    end
  end
end
