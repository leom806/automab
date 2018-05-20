require 'test_helper'

class OrcamentoItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @orcamento_item = orcamento_items(:one)
  end

  test "should get index" do
    get orcamento_items_url, as: :json
    assert_response :success
  end

  test "should create orcamento_item" do
    assert_difference('OrcamentoItem.count') do
      post orcamento_items_url, params: { orcamento_item: { agendamento_id: @orcamento_item.agendamento_id, orcamento_id: @orcamento_item.orcamento_id, quantidade: @orcamento_item.quantidade } }, as: :json
    end

    assert_response 201
  end

  test "should show orcamento_item" do
    get orcamento_item_url(@orcamento_item), as: :json
    assert_response :success
  end

  test "should update orcamento_item" do
    patch orcamento_item_url(@orcamento_item), params: { orcamento_item: { agendamento_id: @orcamento_item.agendamento_id, orcamento_id: @orcamento_item.orcamento_id, quantidade: @orcamento_item.quantidade } }, as: :json
    assert_response 200
  end

  test "should destroy orcamento_item" do
    assert_difference('OrcamentoItem.count', -1) do
      delete orcamento_item_url(@orcamento_item), as: :json
    end

    assert_response 204
  end
end
