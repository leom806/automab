require 'test_helper'

class OrcamentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @orcamento = orcamentos(:one)
  end

  test "should get index" do
    get orcamentos_url, as: :json
    assert_response :success
  end

  test "should create orcamento" do
    assert_difference('Orcamento.count') do
      post orcamentos_url, params: { orcamento: { agendamento_id: @orcamento.agendamento_id, cliente_id: @orcamento.cliente_id, funcionario_id: @orcamento.funcionario_id, servico_concluido: @orcamento.servico_concluido, veiculo_id: @orcamento.veiculo_id } }, as: :json
    end

    assert_response 201
  end

  test "should show orcamento" do
    get orcamento_url(@orcamento), as: :json
    assert_response :success
  end

  test "should update orcamento" do
    patch orcamento_url(@orcamento), params: { orcamento: { agendamento_id: @orcamento.agendamento_id, cliente_id: @orcamento.cliente_id, funcionario_id: @orcamento.funcionario_id, servico_concluido: @orcamento.servico_concluido, veiculo_id: @orcamento.veiculo_id } }, as: :json
    assert_response 200
  end

  test "should destroy orcamento" do
    assert_difference('Orcamento.count', -1) do
      delete orcamento_url(@orcamento), as: :json
    end

    assert_response 204
  end
end
