Rails.application.routes.draw do
  # Routes for the Pack bookmark resource:

  # CREATE
  get("/pack_bookmarks/new", { :controller => "pack_bookmarks", :action => "new_form" })
  post("/create_pack_bookmark", { :controller => "pack_bookmarks", :action => "create_row" })

  # READ
  get("/pack_bookmarks", { :controller => "pack_bookmarks", :action => "index" })
  get("/pack_bookmarks/:id_to_display", { :controller => "pack_bookmarks", :action => "show" })

  # UPDATE
  get("/pack_bookmarks/:prefill_with_id/edit", { :controller => "pack_bookmarks", :action => "edit_form" })
  post("/update_pack_bookmark/:id_to_modify", { :controller => "pack_bookmarks", :action => "update_row" })

  # DELETE
  get("/delete_pack_bookmark/:id_to_remove", { :controller => "pack_bookmarks", :action => "destroy_row" })

  #------------------------------

  # Routes for the Furniture pack resource:

  # CREATE
  get("/furniture_packs/new", { :controller => "furniture_packs", :action => "new_form" })
  post("/create_furniture_pack", { :controller => "furniture_packs", :action => "create_row" })

  # READ
  get("/furniture_packs", { :controller => "furniture_packs", :action => "index" })
  get("/furniture_packs/:id_to_display", { :controller => "furniture_packs", :action => "show" })

  # UPDATE
  get("/furniture_packs/:prefill_with_id/edit", { :controller => "furniture_packs", :action => "edit_form" })
  post("/update_furniture_pack/:id_to_modify", { :controller => "furniture_packs", :action => "update_row" })

  # DELETE
  get("/delete_furniture_pack/:id_to_remove", { :controller => "furniture_packs", :action => "destroy_row" })

  #------------------------------

  # Routes for the Apartment photo resource:

  # CREATE
  get("/apartment_photos/new", { :controller => "apartment_photos", :action => "new_form" })
  post("/create_apartment_photo", { :controller => "apartment_photos", :action => "create_row" })

  # READ
  get("/apartment_photos", { :controller => "apartment_photos", :action => "index" })
  get("/apartment_photos/:id_to_display", { :controller => "apartment_photos", :action => "show" })

  # UPDATE
  get("/apartment_photos/:prefill_with_id/edit", { :controller => "apartment_photos", :action => "edit_form" })
  post("/update_apartment_photo/:id_to_modify", { :controller => "apartment_photos", :action => "update_row" })

  # DELETE
  get("/delete_apartment_photo/:id_to_remove", { :controller => "apartment_photos", :action => "destroy_row" })

  #------------------------------

  # Routes for the Furniture object picture resource:

  # CREATE
  get("/furniture_object_pictures/new", { :controller => "furniture_object_pictures", :action => "new_form" })
  post("/create_furniture_object_picture", { :controller => "furniture_object_pictures", :action => "create_row" })

  # READ
  get("/furniture_object_pictures", { :controller => "furniture_object_pictures", :action => "index" })
  get("/furniture_object_pictures/:id_to_display", { :controller => "furniture_object_pictures", :action => "show" })

  # UPDATE
  get("/furniture_object_pictures/:prefill_with_id/edit", { :controller => "furniture_object_pictures", :action => "edit_form" })
  post("/update_furniture_object_picture/:id_to_modify", { :controller => "furniture_object_pictures", :action => "update_row" })

  # DELETE
  get("/delete_furniture_object_picture/:id_to_remove", { :controller => "furniture_object_pictures", :action => "destroy_row" })

  #------------------------------

  # Routes for the Furtniture object resource:

  # CREATE
  get("/furtniture_objects/new", { :controller => "furtniture_objects", :action => "new_form" })
  post("/create_furtniture_object", { :controller => "furtniture_objects", :action => "create_row" })

  # READ
  get("/furtniture_objects", { :controller => "furtniture_objects", :action => "index" })
  get("/furtniture_objects/:id_to_display", { :controller => "furtniture_objects", :action => "show" })

  # UPDATE
  get("/furtniture_objects/:prefill_with_id/edit", { :controller => "furtniture_objects", :action => "edit_form" })
  post("/update_furtniture_object/:id_to_modify", { :controller => "furtniture_objects", :action => "update_row" })

  # DELETE
  get("/delete_furtniture_object/:id_to_remove", { :controller => "furtniture_objects", :action => "destroy_row" })

  #------------------------------

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
