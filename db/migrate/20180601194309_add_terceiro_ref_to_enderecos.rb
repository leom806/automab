class AddTerceiroRefToEnderecos < ActiveRecord::Migration[5.1]
  def change
    add_reference :enderecos, :terceiro, foreign_key: true
  end
end
