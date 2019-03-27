Rails.application.routes.draw do
  get 'books/_error'
  get 'books/edit'
  get 'books/index'
  get 'books/new'
  get 'books/show'
  get 'show_room/index'
  get 'sessions/new'
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get  "/help", to: "static_pages#help"
    get  "/contact", to: "static_pages#contact"
    get  "/signup", to: "users#new"
    post "/signup", to: "users#create"
    get  "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :users
    resources :hotels
    resources :rooms
    get "/show_room", to: "show_room#index"
  end
end
