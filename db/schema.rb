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

ActiveRecord::Schema.define(version: 20180602040803) do

  create_table "agendamentos", force: :cascade do |t|
    t.integer "funcionario_id"
    t.date "data_solicitacao"
    t.date "data_agendamento"
    t.date "entrega_estimada"
    t.text "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["funcionario_id"], name: "index_agendamentos_on_funcionario_id"
  end

  create_table "cargos", force: :cascade do |t|
    t.string "nome"
    t.float "salario"
    t.text "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categoria_items", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.boolean "juridica"
    t.string "inscricao_municipal"
    t.string "inscricao_estadual"
    t.string "cpf"
    t.string "nome_fantasia"
    t.string "cnpj"
    t.date "data_ultima_alteracao"
    t.date "data_cadastro"
    t.string "rg"
    t.date "data_nascimento"
    t.string "nome_completo"
    t.integer "veiculo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["veiculo_id"], name: "index_clientes_on_veiculo_id"
  end

  create_table "enderecos", force: :cascade do |t|
    t.string "cep"
    t.string "logradouro"
    t.string "numero"
    t.string "complemento"
    t.string "bairro"
    t.string "cidade"
    t.string "uf"
    t.string "telefone"
    t.string "celular"
    t.string "email"
    t.string "website"
    t.integer "cliente_id"
    t.integer "funcionario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_enderecos_on_cliente_id"
    t.index ["funcionario_id"], name: "index_enderecos_on_funcionario_id"
  end

  create_table "funcionarios", force: :cascade do |t|
    t.boolean "juridica"
    t.string "inscricao_municipal"
    t.string "inscricao_estadual"
    t.string "cpf"
    t.string "nome_fantasia"
    t.string "cnpj"
    t.date "data_ultima_alteracao"
    t.date "data_cadastro"
    t.string "rg"
    t.date "data_nascimento"
    t.string "nome_completo"
    t.integer "cargo_id"
    t.boolean "status_pagamento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cargo_id"], name: "index_funcionarios_on_cargo_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "codigo_fabricante"
    t.string "nomeItem"
    t.string "descricao"
    t.date "validade"
    t.decimal "preco", precision: 8, scale: 2
    t.integer "categoria_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categoria_item_id"], name: "index_items_on_categoria_item_id"
  end

  create_table "orcamento_items", force: :cascade do |t|
    t.integer "orcamento_id"
    t.integer "item_id"
    t.integer "quantidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_orcamento_items_on_item_id"
    t.index ["orcamento_id"], name: "index_orcamento_items_on_orcamento_id"
  end

  create_table "orcamentos", force: :cascade do |t|
    t.integer "funcionario_id"
    t.integer "agendamento_id"
    t.integer "cliente_id"
    t.integer "veiculo_id"
    t.boolean "servico_concluido"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agendamento_id"], name: "index_orcamentos_on_agendamento_id"
    t.index ["cliente_id"], name: "index_orcamentos_on_cliente_id"
    t.index ["funcionario_id"], name: "index_orcamentos_on_funcionario_id"
    t.index ["veiculo_id"], name: "index_orcamentos_on_veiculo_id"
  end

  create_table "ordem_servicos", force: :cascade do |t|
    t.decimal "valor_total", precision: 10, scale: 2
    t.text "descricao_servico"
    t.text "observacao"
    t.date "data_criacao"
    t.string "garantia"
    t.boolean "status_pagamento"
    t.integer "orcamento_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["orcamento_id"], name: "index_ordem_servicos_on_orcamento_id"
  end

  create_table "transacaos", force: :cascade do |t|
    t.date "data_transacao"
    t.decimal "valor_recebido", precision: 10, scale: 2
    t.string "forma_pagamento"
    t.integer "ordem_servico_id"
    t.integer "funcionario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["funcionario_id"], name: "index_transacaos_on_funcionario_id"
    t.index ["ordem_servico_id"], name: "index_transacaos_on_ordem_servico_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "senha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "veiculos", force: :cascade do |t|
    t.string "montadora"
    t.string "modelo"
    t.string "versao"
    t.string "placa"
    t.string "chassi"
    t.string "combustivel"
    t.string "cor"
    t.integer "ano_modelo"
    t.integer "ano_fabricacao"
    t.integer "quilometragem"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cliente_id"
    t.index ["cliente_id"], name: "index_veiculos_on_cliente_id"
  end

end
