Rails.application.routes.draw do

  resources :orcamentos
  namespace 'api' do
    namespace 'v1' do

      resources :categoria_items
      resources :items
      resources :cargos
      resources :terceiros
      resources :agendamentos
      
    end
  end
end
