class FurnitureCategoryPicturesController < ApplicationController
  def index
    @furniture_category_pictures = FurnitureCategoryPicture.all

    render("furniture_category_picture_templates/index.html.erb")
  end

  def show
    @furniture_category_picture = FurnitureCategoryPicture.find(params.fetch("id_to_display"))

    render("furniture_category_picture_templates/show.html.erb")
  end

  def new_form
    @furniture_category_picture = FurnitureCategoryPicture.new

    render("furniture_category_picture_templates/new_form.html.erb")
  end

  def create_row
    @furniture_category_picture = FurnitureCategoryPicture.new

    @furniture_category_picture.category_id = params.fetch("category_id")
    @furniture_category_picture.picture = params.fetch("picture") if params.key?("picture")

    if @furniture_category_picture.valid?
      @furniture_category_picture.save

      redirect_back(:fallback_location => "/furniture_category_pictures", :notice => "Furniture category picture created successfully.")
    else
      render("furniture_category_picture_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_furniture_category
    @furniture_category_picture = FurnitureCategoryPicture.new

    @furniture_category_picture.category_id = params.fetch("category_id")
    @furniture_category_picture.picture = params.fetch("picture") if params.key?("picture")

    if @furniture_category_picture.valid?
      @furniture_category_picture.save

      redirect_to("/furniture_categories/#{@furniture_category_picture.category_id}", notice: "FurnitureCategoryPicture created successfully.")
    else
      render("furniture_category_picture_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @furniture_category_picture = FurnitureCategoryPicture.find(params.fetch("prefill_with_id"))

    render("furniture_category_picture_templates/edit_form.html.erb")
  end

  def update_row
    @furniture_category_picture = FurnitureCategoryPicture.find(params.fetch("id_to_modify"))

    @furniture_category_picture.category_id = params.fetch("category_id")
    @furniture_category_picture.picture = params.fetch("picture") if params.key?("picture")

    if @furniture_category_picture.valid?
      @furniture_category_picture.save

      redirect_to("/furniture_category_pictures/#{@furniture_category_picture.id}", :notice => "Furniture category picture updated successfully.")
    else
      render("furniture_category_picture_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_category
    @furniture_category_picture = FurnitureCategoryPicture.find(params.fetch("id_to_remove"))

    @furniture_category_picture.destroy

    redirect_to("/furniture_categories/#{@furniture_category_picture.category_id}", notice: "FurnitureCategoryPicture deleted successfully.")
  end

  def destroy_row
    @furniture_category_picture = FurnitureCategoryPicture.find(params.fetch("id_to_remove"))

    @furniture_category_picture.destroy

    redirect_to("/furniture_category_pictures", :notice => "Furniture category picture deleted successfully.")
  end
end
