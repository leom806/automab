
Transacao.delete_all
OrdemServico.delete_all
Orcamento.delete_all
Agendamento.delete_all
Funcionario.delete_all
Endereco.delete_all
Cargo.delete_all
Item.delete_all
CategoriaItem.delete_all
Cliente.delete_all
Veiculo.delete_all

# Usuario.delete_all
# Usuario.create!({
#   nome: "admin",
#   senha: "123",
#   email: "admin@gmail.com"
# })


def chars
  'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ'
end

def numbers 
  '0123456789'
end

def charset 
  chars + numbers
end

def gerar_placa
  (0...3).map { chars[rand(chars.size)] }.join + (0...4).map { numbers[rand(numbers.size)] }.join
end

def gerar_chassi
  (0...17).map { charset[rand(charset.size)] } .join
end

5.times do |i|

  cliente = Cliente.create!({
    juridica: false,
    cpf: rand(11111111111...99999999999).to_s,    
    data_cadastro: Time.zone.now,
    rg: rand(111111111...999999999),
    data_nascimento: '17/09/1997',
    nome_completo: 'Cliente'
  })

  veiculo = Veiculo.create!({
    montadora: ["Volkswagen", "GM", "Porsche", "Nissan"][rand(0..3)],
    modelo: "Modelo",
    versao: "Versão",
    placa: gerar_placa,
    chassi: gerar_chassi,
    combustivel: ["Gasolina", "Álcool"][rand(2)],
    cor: ["Preto", "Prata"][rand(2)],
    ano_modelo: Date.today.to_s,
    ano_fabricacao: Date.today.to_s,
    quilometragem: rand(1000..100000),
    cliente_id: cliente.id
  })

  categoria_item = CategoriaItem.create!({
    descricao: "Categoria nº #{i+1}"
  })

  item = Item.create!({
    categoria_item_id: categoria_item.id,
    codigo_fabricante: 'Mais um fabricante',
    nomeItem: "Item nº #{i+1}",
    descricao: 'Item importante',
    validade: (Date.today + 30).to_s,
    preco: 69.69
  })

  cargo = Cargo.create!({
    nome: 'Nome nº ' + (i+1).to_s,
    salario: 69.69,
    descricao: 'Mais uma descrição'
  })

  endereco = Endereco.create!({
    cliente_id: (0==i ? cliente.id : nil),
    funcionario_id: (0==i ? nil : Funcionario.last.id),
    cep: rand(11111111...99999999).to_s,
    logradouro: 'Rua do Momente Lindo',
    numero: rand(111...999).to_s,
    complemento: 'Lugar dos Infernos',
    bairro: 'Bairro Chique',
    cidade: 'Vinheeeedo',
    uf: 'SP',
    telefone: rand(300000000...499999999).to_s,
    celular: rand(911111111...999999999).to_s,
    email: "emailgenérico#{rand(0...99)}@hotmail.com",
    website: "sitegenerico#{rand(0...99)}.com"
  })

  funcionario = Funcionario.create!({
    juridica: false,
    cpf: rand(11111111111...99999999999).to_s,
    data_cadastro: Time.zone.now,    
    rg: rand(111111111...999999999),
    data_nascimento: Date.new(1997, 9, 17).to_s,
    nome_completo: 'Funcionário',
    cargo_id: cargo.id
  })

  agendamento = Agendamento.create!({
    funcionario_id: funcionario.id,
    data_solicitacao: Date.today + 10,
    data_agendamento: Date.today,
    entrega_estimada: Date.today + 15,
    descricao: "Descrição: cliente quer ..."
  })  

  orcamento = Orcamento.create!({
    funcionario_id: funcionario.id,
    agendamento_id: agendamento.id,
    cliente_id: cliente.id,
    veiculo_id: veiculo.id,
    servico_concluido: true
  })

  (0..6).to_a[rand(6)].times do |j|
    OrcamentoItem.create!({
      orcamento_id: orcamento.id,
      item_id: item.id,
      quantidade: j
    })
  end

  ordem_servico = OrdemServico.create!({
    orcamento_id: orcamento.id ,
    valor_total: rand(10..10000),
    descricao_servico: "Descrição",
    observacao: "Observação",
    data_criacao: (Date.today + rand(15)).to_s,
    garantia: "3 meses ou 5.000km",
    status_pagamento: true
  })

  transacao = Transacao.create!({
    ordem_servico_id: ordem_servico.id,
    funcionario_id: funcionario.id,
    data_transacao: Date.today.to_s,
    valor_recebido: 69.69,
    forma_pagamento: ['à vista', 'parcelado 3x', 'boleto 6x'][rand(3)]
  })
  
end