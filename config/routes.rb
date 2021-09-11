Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "beverages#index"

  resources :beverages
  resources :ingredients, only: :index
  put "/update_inventory", to: "ingredients#update_inventory"

  post "/place_order", to: "orders#checkout"
end
