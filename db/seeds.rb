# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CategoriaItem.delete_all

5.times do |i|
  CategoriaItem.create({
    descricao: 'Categoria nº '+(i+1).to_s
  })
end

Item.delete_all

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