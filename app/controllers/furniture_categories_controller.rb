class FurnitureCategoriesController < ApplicationController
  def index
    @furniture_categories = FurnitureCategory.all

    render("furniture_category_templates/index.html.erb")
  end

  def show
    @furniture_category = FurnitureCategory.find(params.fetch("id_to_display"))

    render("furniture_category_templates/show.html.erb")
  end

  def new_form
    @furniture_category = FurnitureCategory.new

    render("furniture_category_templates/new_form.html.erb")
  end

  def create_row
    @furniture_category = FurnitureCategory.new

    @furniture_category.items = params.fetch("items")
    @furniture_category.name = params.fetch("name")
    @furniture_category.furniture_pack_id = params.fetch("furniture_pack_id")
    @furniture_category.number_of_items = params.fetch("number_of_items")
    @furniture_category.price = params.fetch("price")

    if @furniture_category.valid?
      @furniture_category.save

      redirect_back(:fallback_location => "/furniture_categories", :notice => "Furniture category created successfully.")
    else
      render("furniture_category_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @furniture_category = FurnitureCategory.find(params.fetch("prefill_with_id"))

    render("furniture_category_templates/edit_form.html.erb")
  end

  def update_row
    @furniture_category = FurnitureCategory.find(params.fetch("id_to_modify"))

    @furniture_category.items = params.fetch("items")
    @furniture_category.name = params.fetch("name")
    @furniture_category.furniture_pack_id = params.fetch("furniture_pack_id")
    @furniture_category.number_of_items = params.fetch("number_of_items")
    @furniture_category.price = params.fetch("price")

    if @furniture_category.valid?
      @furniture_category.save

      redirect_to("/furniture_categories/#{@furniture_category.id}", :notice => "Furniture category updated successfully.")
    else
      render("furniture_category_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_furniture_pack
    @furniture_category = FurnitureCategory.find(params.fetch("id_to_remove"))

    @furniture_category.destroy

    redirect_to("/furniture_packs/#{@furniture_category.furniture_pack_id}", notice: "FurnitureCategory deleted successfully.")
  end

  def destroy_row
    @furniture_category = FurnitureCategory.find(params.fetch("id_to_remove"))

    @furniture_category.destroy

    redirect_to("/furniture_categories", :notice => "Furniture category deleted successfully.")
  end
end
