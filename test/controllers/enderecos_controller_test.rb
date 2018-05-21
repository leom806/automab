require 'test_helper'

class EnderecosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @endereco = enderecos(:one)
  end

  test "should get index" do
    get enderecos_url, as: :json
    assert_response :success
  end

  test "should create endereco" do
    assert_difference('Endereco.count') do
      post enderecos_url, params: { endereco: { bairro: @endereco.bairro, celular: @endereco.celular, cep: @endereco.cep, cidade: @endereco.cidade, complemento: @endereco.complemento, email: @endereco.email, logradouro: @endereco.logradouro, numero: @endereco.numero, telefone: @endereco.telefone, uf: @endereco.uf, website: @endereco.website } }, as: :json
    end

    assert_response 201
  end

  test "should show endereco" do
    get endereco_url(@endereco), as: :json
    assert_response :success
  end

  test "should update endereco" do
    patch endereco_url(@endereco), params: { endereco: { bairro: @endereco.bairro, celular: @endereco.celular, cep: @endereco.cep, cidade: @endereco.cidade, complemento: @endereco.complemento, email: @endereco.email, logradouro: @endereco.logradouro, numero: @endereco.numero, telefone: @endereco.telefone, uf: @endereco.uf, website: @endereco.website } }, as: :json
    assert_response 200
  end

  test "should destroy endereco" do
    assert_difference('Endereco.count', -1) do
      delete endereco_url(@endereco), as: :json
    end

    assert_response 204
  end
end
