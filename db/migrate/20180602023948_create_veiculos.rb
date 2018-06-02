class CreateVeiculos < ActiveRecord::Migration[5.1]
  def change
    create_table :veiculos do |t|
      t.string  :montadora
      t.string  :modelo
      t.string  :versao
      t.string  :placa
      t.string  :chassi
      t.date    :ano_fabricacao
      t.date    :ano_modelo
      t.string  :combustivel
      t.integer :quilometragem
      t.string  :cor

      t.timestamps
    end
  end
end
