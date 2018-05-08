Rails.application.routes.draw do
  
  namespace 'api' do
    namespace 'v1' do
      resources :categoria_item
      resources :item
    end
  end

end
