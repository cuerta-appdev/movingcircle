class FurnitureObjectPicturesController < ApplicationController
  def index
    @furniture_object_pictures = FurnitureObjectPicture.all

    render("furniture_object_picture_templates/index.html.erb")
  end

  def show
    @furniture_object_picture = FurnitureObjectPicture.find(params.fetch("id_to_display"))

    render("furniture_object_picture_templates/show.html.erb")
  end

  def new_form
    @furniture_object_picture = FurnitureObjectPicture.new

    render("furniture_object_picture_templates/new_form.html.erb")
  end

  def create_row
    @furniture_object_picture = FurnitureObjectPicture.new

    @furniture_object_picture.picture = params.fetch("picture")
    @furniture_object_picture.furniture_object_id = params.fetch("furniture_object_id")

    if @furniture_object_picture.valid?
      @furniture_object_picture.save

      redirect_back(:fallback_location => "/furniture_object_pictures", :notice => "Furniture object picture created successfully.")
    else
      render("furniture_object_picture_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_furtniture_object
    @furniture_object_picture = FurnitureObjectPicture.new

    @furniture_object_picture.picture = params.fetch("picture")
    @furniture_object_picture.furniture_object_id = params.fetch("furniture_object_id")

    if @furniture_object_picture.valid?
      @furniture_object_picture.save

      redirect_to("/furtniture_objects/#{@furniture_object_picture.furniture_object_id}", notice: "FurnitureObjectPicture created successfully.")
    else
      render("furniture_object_picture_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @furniture_object_picture = FurnitureObjectPicture.find(params.fetch("prefill_with_id"))

    render("furniture_object_picture_templates/edit_form.html.erb")
  end

  def update_row
    @furniture_object_picture = FurnitureObjectPicture.find(params.fetch("id_to_modify"))

    @furniture_object_picture.picture = params.fetch("picture")
    @furniture_object_picture.furniture_object_id = params.fetch("furniture_object_id")

    if @furniture_object_picture.valid?
      @furniture_object_picture.save

      redirect_to("/furniture_object_pictures/#{@furniture_object_picture.id}", :notice => "Furniture object picture updated successfully.")
    else
      render("furniture_object_picture_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_furniture_object
    @furniture_object_picture = FurnitureObjectPicture.find(params.fetch("id_to_remove"))

    @furniture_object_picture.destroy

    redirect_to("/furtniture_objects/#{@furniture_object_picture.furniture_object_id}", notice: "FurnitureObjectPicture deleted successfully.")
  end

  def destroy_row
    @furniture_object_picture = FurnitureObjectPicture.find(params.fetch("id_to_remove"))

    @furniture_object_picture.destroy

    redirect_to("/furniture_object_pictures", :notice => "Furniture object picture deleted successfully.")
  end
end
