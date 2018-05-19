class CreateOrcamentos < ActiveRecord::Migration[5.1]
  def change
    create_table :orcamentos do |t|
      t.string :funcionario #, foreign_key: true
      t.string :agendamento #, foreign_key: true
      t.string :cliente     #, foreign_key: true
      t.string :veiculo     #, foreign_key: true
      t.boolean :servico_concluido

      t.timestamps
    end
  end
end
