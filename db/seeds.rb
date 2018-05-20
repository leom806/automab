
OrcamentoItem.delete_all
Orcamento.delete_all
Item.delete_all
CategoriaItem.delete_all
Cargo.delete_all

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