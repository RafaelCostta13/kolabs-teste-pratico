Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: "filme#index"
  post 'filme/buscar_filme'
  get 'detalhes/:id', to: "filme#detalhes_filme"

  get 'series/:nome', to: "filme#filtro_serie"
  get 'filmes/:nome', to: "filme#filtro_filme"
  get 'pessoas/:nome',to: "filme#filtro_pessoa"
  get 'coletaneas/:nome', to: "filme#filtro_coletanea"
  get 'palavras_chave/:nome', to: "filme#filtro_palavras_chave"
  get 'produtoras/:nome', to: "filme#filtro_produtoras"
end
