class CreateOrcamentos < ActiveRecord::Migration[5.1]
  def change
    create_table :orcamentos do |t|
      t.references :funcionario , index: true
      t.references :agendamento , index: true
      t.references :cliente     , index: true
      t.references :veiculo     , index: true
      t.boolean :servico_concluido

      t.timestamps
    end
  end
end
