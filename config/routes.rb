Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: "filme#index"
  post 'filme/buscar_filme'
  get 'detalhes/:id', to: "filme#detalhes_filme"

  
end
