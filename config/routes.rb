Rails.application.routes.draw do

<<<<<<< HEAD
=======
  root 'api/v1/main#api_v1_doc'
  
>>>>>>> e95808b7c248a8059b540138e94d2126e723654d
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
      resources :transacoes
      resources :ordem_servicos
      
    end
  end
end
