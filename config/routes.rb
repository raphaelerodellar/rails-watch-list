Rails.application.routes.draw do
  get "bookmarks/new"
  get "lists/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"

  get "lists", to: "lists#index"
  get "lists/new", to: "lists#new"
  get "lists/:id", to: "lists#show", as: :list
  post "lists", to: "lists#create"

  get "lists/:list_id/bookmarks/new", to: "bookmarks#new", as: :new_list_bookmark
  post "lists/:list_id/bookmarks", to: "bookmarks#create", as: :list_bookmarks
  delete "bookmarks/:id", to: "bookmarks#destroy"

end
