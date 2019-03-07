class FurniturePacksController < ApplicationController
  def index
    @furniture_packs = FurniturePack.all

    render("furniture_pack_templates/index.html.erb")
  end

  def show
    @furniture_pack = FurniturePack.find(params.fetch("id_to_display"))

    render("furniture_pack_templates/show.html.erb")
  end

  def new_form
    @furniture_pack = FurniturePack.new

    render("furniture_pack_templates/new_form.html.erb")
  end

  def create_row
    @furniture_pack = FurniturePack.new

    @furniture_pack.description = params.fetch("description")
    @furniture_pack.user_id = params.fetch("user_id")
    @furniture_pack.price = params.fetch("price")
    @furniture_pack.number_of_items = params.fetch("number_of_items")
    @furniture_pack.storage_conditions = params.fetch("storage_conditions")
    @furniture_pack.apartment_sq_footage = params.fetch("apartment_sq_footage")
    @furniture_pack.apartment_number_of_bedrooms = params.fetch("apartment_number_of_bedrooms")
    @furniture_pack.apartment_number_of_bathrooms = params.fetch("apartment_number_of_bathrooms")
    @furniture_pack.apartment_building_name = params.fetch("apartment_building_name")

    if @furniture_pack.valid?
      @furniture_pack.save

      redirect_back(:fallback_location => "/furniture_packs", :notice => "Furniture pack created successfully.")
    else
      render("furniture_pack_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @furniture_pack = FurniturePack.find(params.fetch("prefill_with_id"))

    render("furniture_pack_templates/edit_form.html.erb")
  end

  def update_row
    @furniture_pack = FurniturePack.find(params.fetch("id_to_modify"))

    @furniture_pack.description = params.fetch("description")
    @furniture_pack.user_id = params.fetch("user_id")
    @furniture_pack.price = params.fetch("price")
    @furniture_pack.number_of_items = params.fetch("number_of_items")
    @furniture_pack.storage_conditions = params.fetch("storage_conditions")
    @furniture_pack.apartment_sq_footage = params.fetch("apartment_sq_footage")
    @furniture_pack.apartment_number_of_bedrooms = params.fetch("apartment_number_of_bedrooms")
    @furniture_pack.apartment_number_of_bathrooms = params.fetch("apartment_number_of_bathrooms")
    @furniture_pack.apartment_building_name = params.fetch("apartment_building_name")

    if @furniture_pack.valid?
      @furniture_pack.save

      redirect_to("/furniture_packs/#{@furniture_pack.id}", :notice => "Furniture pack updated successfully.")
    else
      render("furniture_pack_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @furniture_pack = FurniturePack.find(params.fetch("id_to_remove"))

    @furniture_pack.destroy

    redirect_to("/users/#{@furniture_pack.user_id}", notice: "FurniturePack deleted successfully.")
  end

  def destroy_row
    @furniture_pack = FurniturePack.find(params.fetch("id_to_remove"))

    @furniture_pack.destroy

    redirect_to("/furniture_packs", :notice => "Furniture pack deleted successfully.")
  end
end
