Rails.application.routes.draw do

  resources :terceiros
  namespace 'api' do
    namespace 'v1' do
      resources :categoria_item
      resources :item
      resources :cargos
    end
  end
end
