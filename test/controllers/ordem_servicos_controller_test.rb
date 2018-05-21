require 'test_helper'

class OrdemServicosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ordem_servico = ordem_servicos(:one)
  end

  test "should get index" do
    get ordem_servicos_url, as: :json
    assert_response :success
  end

  test "should create ordem_servico" do
    assert_difference('OrdemServico.count') do
      post ordem_servicos_url, params: { ordem_servico: { data_criacao: @ordem_servico.data_criacao, descricao_servico: @ordem_servico.descricao_servico, garantia: @ordem_servico.garantia, observacao: @ordem_servico.observacao, orcamento_id: @ordem_servico.orcamento_id, status_pagamento: @ordem_servico.status_pagamento, valor_total: @ordem_servico.valor_total } }, as: :json
    end

    assert_response 201
  end

  test "should show ordem_servico" do
    get ordem_servico_url(@ordem_servico), as: :json
    assert_response :success
  end

  test "should update ordem_servico" do
    patch ordem_servico_url(@ordem_servico), params: { ordem_servico: { data_criacao: @ordem_servico.data_criacao, descricao_servico: @ordem_servico.descricao_servico, garantia: @ordem_servico.garantia, observacao: @ordem_servico.observacao, orcamento_id: @ordem_servico.orcamento_id, status_pagamento: @ordem_servico.status_pagamento, valor_total: @ordem_servico.valor_total } }, as: :json
    assert_response 200
  end

  test "should destroy ordem_servico" do
    assert_difference('OrdemServico.count', -1) do
      delete ordem_servico_url(@ordem_servico), as: :json
    end

    assert_response 204
  end
end
