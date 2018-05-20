# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180519233914) do

  create_table "agendamentos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "funcionario"
    t.date "data_solicitacao"
    t.date "data_agendamento"
    t.date "entrega_estimada"
    t.text "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cargos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nome"
    t.float "salario", limit: 24
    t.text "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categoria_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "codigoFabricante"
    t.string "nomeItem"
    t.string "descricao"
    t.date "validade"
    t.decimal "preco", precision: 8, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "categoria_item_id"
    t.index ["categoria_item_id"], name: "index_items_on_categoria_item_id"
  end

  create_table "orcamento_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "orcamento_id"
    t.bigint "item_id"
    t.integer "quantidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_orcamento_items_on_item_id"
    t.index ["orcamento_id"], name: "index_orcamento_items_on_orcamento_id"
  end

  create_table "orcamentos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "funcionario"
    t.string "agendamento"
    t.string "cliente"
    t.string "veiculo"
    t.boolean "servico_concluido"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "terceiros", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean "juridica"
    t.string "inscricao_municipal"
    t.string "cpf"
    t.string "nome_fantasia"
    t.string "cnpj"
    t.date "data_ultima_alteracao"
    t.string "tipo_terceiro"
    t.date "data_cadastro"
    t.string "rg"
    t.date "data_nascimento"
    t.string "nome_completo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "items", "categoria_items"
  add_foreign_key "orcamento_items", "items"
  add_foreign_key "orcamento_items", "orcamentos"
end
