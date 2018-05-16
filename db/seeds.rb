
Cargo.delete_all
Item.delete_all
CategoriaItem.delete_all

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
