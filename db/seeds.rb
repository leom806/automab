
Usuario.delete_all
Endereco.delete_all
OrcamentoItem.delete_all
Orcamento.delete_all
Item.delete_all
CategoriaItem.delete_all
Cargo.delete_all

Usuario.create({
  nome: "admin",
  senha: "123",
  email: "admin@gmail.com"
})

5.times do |i|
  CategoriaItem.create({
    descricao: 'Categoria nº '+(i+1).to_s
  })
end

5.times do |i|
  Item.create({
    categoria_item_id: CategoriaItem.first.id,
    codigoFabricante: 'Mais um fabricante',
    nomeItem: 'Item nº '+(i+1).to_s,
    descricao: 'Item importante',
    validade: Date.today + 30,
    preco: 69.69
  })
end

5.times do |i|
  Cargo.create({
    nome: 'Nome nº ' + (i+1).to_s,
    salario: 69.69,
    descricao: 'Mais uma descrição'
  })
end

5.times do |i|
  Orcamento.create({
    funcionario: '#funcionario '+i.to_s,
    agendamento: '#agendamento',
    cliente: '#cliente',
    veiculo: '#veiculo',
    servico_concluido: true
  })
end

5.times do |i|
  OrcamentoItem.create({
    orcamento_id: Orcamento.first.id,
    item_id: Item.first.id,
    quantidade: i
  })
end

# 5.times do |i|
#   Transacao.create({
#     ordem_servico_id: OrdemServico.first.id,
#     funcionario_id: Funcionario.first.id,
#     data_transacao: Date.today,
#     valor_recebido: 69.69,
#     forma_pagamento: 'a vista'
#   })
# end


# 5.times do |i|
#   Cliente.create({
#     juridica: false,
#     cpf: rand(11111111111...99999999999).to_s,
#     type: "Cliente",
#     data_cadastro: Time.zone.now,
#     rg: rand(111111111...999999999),
#     data_nascimento: '17/09/1997',
#     nome_completo: 'Terceiro Genérico'
#   })
# end

# Funcionario.create({
#   juridica: false,
#   cpf: rand(11111111111...99999999999).to_s,
#   data_cadastro: Time.zone.now,
#   type: "Funcionario",
#   rg: rand(111111111...999999999),
#   data_nascimento: '17/09/1997',
#   nome_completo: 'Terceiro Genérico',
#   cargo_id: Cargo.first.id
# })

# 5.times do |i|
#   Endereco.create({
#     terceiro_id: Cliente.first.id,
#     cep: rand(11111111...99999999).to_s,
#     logradouro: 'Rua do Momente Lindo',
#     numero: rand(111...999).to_s,
#     complemento: 'Lugar dos Infernos',
#     bairro: 'Bairro Chique',
#     cidade: 'Vinheeeedo',
#     uf: 'SP',
#     telefone: rand(300000000...499999999).to_s,
#     celular: rand(111111111...999999999).to_s,
#     email: "safadinhadofuckbook#{rand(0...99)}@hotmail.com",
#     website: "sitegenerico#{rand(0...99)}.com"
#   })
# end