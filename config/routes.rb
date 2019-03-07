Rails.application.routes.draw do
  # Routes for the Apartment resource:

  # CREATE
  get("/apartments/new", { :controller => "apartments", :action => "new_form" })
  post("/create_apartment", { :controller => "apartments", :action => "create_row" })

  # READ
  get("/apartments", { :controller => "apartments", :action => "index" })
  get("/apartments/:id_to_display", { :controller => "apartments", :action => "show" })

  # UPDATE
  get("/apartments/:prefill_with_id/edit", { :controller => "apartments", :action => "edit_form" })
  post("/update_apartment/:id_to_modify", { :controller => "apartments", :action => "update_row" })

  # DELETE
  get("/delete_apartment/:id_to_remove", { :controller => "apartments", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
