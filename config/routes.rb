Rails.application.routes.draw do
  
  resources :usuarios
  
  root 'api/v1/main#index', as: 'home'
  
  scope module: 'api' do
    scope module: 'v1' do
      
      get '/', to: 'main#index'
      
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
      resources :veiculos
      resources :clientes
      resources :funcionarios
      
    end
  end

end
