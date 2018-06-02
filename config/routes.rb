Rails.application.routes.draw do

  resources :funcionarios
  resources :clientes
  resources :veiculos
  resources :usuarios
  
  root 'api/v1/main#api_v1_doc'

  namespace 'api' do
    namespace 'v1' do
      
      get '/', to: 'main#api_v1_doc'
      
      resources :categoria_items
      resources :items
      resources :cargos
      resources :terceiros
      resources :agendamentos
      resources :orcamento_items
      resources :orcamentos
      resources :transacaos
      resources :ordem_servicos
      resources :enderecos
      
    end
  end

end
