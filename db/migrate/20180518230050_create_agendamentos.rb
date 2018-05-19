class CreateAgendamentos < ActiveRecord::Migration[5.1]
  def change
    create_table :agendamentos do |t|
      t.string :funcionario #, foreign_key: true
      t.date :data_solicitacao
      t.date :data_agendamento
      t.date :entrega_estimada
      t.text :descricao

      t.timestamps
    end
  end
end
