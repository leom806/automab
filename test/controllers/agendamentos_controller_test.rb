require 'test_helper'

class AgendamentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @agendamento = agendamentos(:one)
  end

  test "should get index" do
    get agendamentos_url, as: :json
    assert_response :success
  end

  test "should create agendamento" do
    assert_difference('Agendamento.count') do
      post agendamentos_url, params: { agendamento: { data_agendamento: @agendamento.data_agendamento, data_solicitacao: @agendamento.data_solicitacao, descricao: @agendamento.descricao, entrega_estimada: @agendamento.entrega_estimada, funcionario_id: @agendamento.funcionario_id } }, as: :json
    end

    assert_response 201
  end

  test "should show agendamento" do
    get agendamento_url(@agendamento), as: :json
    assert_response :success
  end

  test "should update agendamento" do
    patch agendamento_url(@agendamento), params: { agendamento: { data_agendamento: @agendamento.data_agendamento, data_solicitacao: @agendamento.data_solicitacao, descricao: @agendamento.descricao, entrega_estimada: @agendamento.entrega_estimada, funcionario_id: @agendamento.funcionario_id } }, as: :json
    assert_response 200
  end

  test "should destroy agendamento" do
    assert_difference('Agendamento.count', -1) do
      delete agendamento_url(@agendamento), as: :json
    end

    assert_response 204
  end
end
