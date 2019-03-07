class FurtnitureObjectsController < ApplicationController
  def index
    @furtniture_objects = FurtnitureObject.all

    render("furtniture_object_templates/index.html.erb")
  end

  def show
    @furtniture_object = FurtnitureObject.find(params.fetch("id_to_display"))

    render("furtniture_object_templates/show.html.erb")
  end

  def new_form
    @furtniture_object = FurtnitureObject.new

    render("furtniture_object_templates/new_form.html.erb")
  end

  def create_row
    @furtniture_object = FurtnitureObject.new

    @furtniture_object.price = params.fetch("price")
    @furtniture_object.description = params.fetch("description")
    @furtniture_object.furniture_pack_id = params.fetch("furniture_pack_id")
    @furtniture_object.category_id = params.fetch("category_id")
    @furtniture_object.name = params.fetch("name")

    if @furtniture_object.valid?
      @furtniture_object.save

      redirect_back(:fallback_location => "/furtniture_objects", :notice => "Furtniture object created successfully.")
    else
      render("furtniture_object_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @furtniture_object = FurtnitureObject.find(params.fetch("prefill_with_id"))

    render("furtniture_object_templates/edit_form.html.erb")
  end

  def update_row
    @furtniture_object = FurtnitureObject.find(params.fetch("id_to_modify"))

    @furtniture_object.price = params.fetch("price")
    @furtniture_object.description = params.fetch("description")
    @furtniture_object.furniture_pack_id = params.fetch("furniture_pack_id")
    @furtniture_object.category_id = params.fetch("category_id")
    @furtniture_object.name = params.fetch("name")

    if @furtniture_object.valid?
      @furtniture_object.save

      redirect_to("/furtniture_objects/#{@furtniture_object.id}", :notice => "Furtniture object updated successfully.")
    else
      render("furtniture_object_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_furniture_pack
    @furtniture_object = FurtnitureObject.find(params.fetch("id_to_remove"))

    @furtniture_object.destroy

    redirect_to("/furniture_packs/#{@furtniture_object.furniture_pack_id}", notice: "FurtnitureObject deleted successfully.")
  end

  def destroy_row_from_category
    @furtniture_object = FurtnitureObject.find(params.fetch("id_to_remove"))

    @furtniture_object.destroy

    redirect_to("/furniture_categories/#{@furtniture_object.category_id}", notice: "FurtnitureObject deleted successfully.")
  end

  def destroy_row
    @furtniture_object = FurtnitureObject.find(params.fetch("id_to_remove"))

    @furtniture_object.destroy

    redirect_to("/furtniture_objects", :notice => "Furtniture object deleted successfully.")
  end
end
