class AmenityPicturesController < ApplicationController
  def index
    @q = AmenityPicture.ransack(params[:q])
    @amenity_pictures = @q.result(:distinct => true).includes(:building_amenity).page(params[:page]).per(10)

    render("amenity_picture_templates/index.html.erb")
  end

  def show
    @amenity_picture = AmenityPicture.find(params.fetch("id_to_display"))

    render("amenity_picture_templates/show.html.erb")
  end

  def new_form
    @amenity_picture = AmenityPicture.new

    render("amenity_picture_templates/new_form.html.erb")
  end

  def create_row
    @amenity_picture = AmenityPicture.new

    @amenity_picture.picture = params.fetch("picture") if params.key?("picture")
    @amenity_picture.description = params.fetch("description")
    @amenity_picture.building_amenity_id = params.fetch("building_amenity_id")

    if @amenity_picture.valid?
      @amenity_picture.save

      redirect_back(:fallback_location => "/amenity_pictures", :notice => "Amenity picture created successfully.")
    else
      render("amenity_picture_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_building_amenity
    @amenity_picture = AmenityPicture.new

    @amenity_picture.picture = params.fetch("picture") if params.key?("picture")
    @amenity_picture.description = params.fetch("description")
    @amenity_picture.building_amenity_id = params.fetch("building_amenity_id")

    if @amenity_picture.valid?
      @amenity_picture.save

      redirect_to("/building_amenities/#{@amenity_picture.building_amenity_id}", notice: "AmenityPicture created successfully.")
    else
      render("amenity_picture_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @amenity_picture = AmenityPicture.find(params.fetch("prefill_with_id"))

    render("amenity_picture_templates/edit_form.html.erb")
  end

  def update_row
    @amenity_picture = AmenityPicture.find(params.fetch("id_to_modify"))

    @amenity_picture.picture = params.fetch("picture") if params.key?("picture")
    @amenity_picture.description = params.fetch("description")
    @amenity_picture.building_amenity_id = params.fetch("building_amenity_id")

    if @amenity_picture.valid?
      @amenity_picture.save

      redirect_to("/amenity_pictures/#{@amenity_picture.id}", :notice => "Amenity picture updated successfully.")
    else
      render("amenity_picture_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_building_amenity
    @amenity_picture = AmenityPicture.find(params.fetch("id_to_remove"))

    @amenity_picture.destroy

    redirect_to("/building_amenities/#{@amenity_picture.building_amenity_id}", notice: "AmenityPicture deleted successfully.")
  end

  def destroy_row
    @amenity_picture = AmenityPicture.find(params.fetch("id_to_remove"))

    @amenity_picture.destroy

    redirect_to("/amenity_pictures", :notice => "Amenity picture deleted successfully.")
  end
end
