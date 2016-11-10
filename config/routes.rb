Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "movies#index"
  # Routes for the Movie resource:
  # CREATE
  get "/movies/new", :controller => "movies", :action => "new"
  post "/create_movie", :controller => "movies", :action => "create"

  # READ
  get "/movies", :controller => "movies", :action => "index"
  get "/movies/:id", :controller => "movies", :action => "show"

  # UPDATE
  get "/movies/:id/edit", :controller => "movies", :action => "edit"
  post "/update_movie/:id", :controller => "movies", :action => "update"

  # DELETE
  get "/delete_movie/:id", :controller => "movies", :action => "destroy"
  #------------------------------

  devise_for :directors
  # Routes for the Director resource:
  # READ
  get "/directors", :controller => "directors", :action => "index"
  get "/directors/:id", :controller => "directors", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
