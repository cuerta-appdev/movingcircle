class BuildingAmenitiesController < ApplicationController
  def index
    @building_amenities = BuildingAmenity.page(params[:page]).per(10)

    render("building_amenity_templates/index.html.erb")
  end

  def show
    @amenity_picture = AmenityPicture.new
    @building_amenity = BuildingAmenity.find(params.fetch("id_to_display"))

    render("building_amenity_templates/show.html.erb")
  end

  def new_form
    @building_amenity = BuildingAmenity.new

    render("building_amenity_templates/new_form.html.erb")
  end

  def create_row
    @building_amenity = BuildingAmenity.new

    @building_amenity.building_id = params.fetch("building_id")
    @building_amenity.amenity_id = params.fetch("amenity_id")

    if @building_amenity.valid?
      @building_amenity.save

      redirect_back(:fallback_location => "/building_amenities", :notice => "Building amenity created successfully.")
    else
      render("building_amenity_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_amenity
    @building_amenity = BuildingAmenity.new

    @building_amenity.building_id = params.fetch("building_id")
    @building_amenity.amenity_id = params.fetch("amenity_id")

    if @building_amenity.valid?
      @building_amenity.save

      redirect_to("/amenities/#{@building_amenity.amenity_id}", notice: "BuildingAmenity created successfully.")
    else
      render("building_amenity_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_building
    @building_amenity = BuildingAmenity.new

    @building_amenity.building_id = params.fetch("building_id")
    @building_amenity.amenity_id = params.fetch("amenity_id")

    if @building_amenity.valid?
      @building_amenity.save

      redirect_to("/buildings/#{@building_amenity.building_id}", notice: "BuildingAmenity created successfully.")
    else
      render("building_amenity_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @building_amenity = BuildingAmenity.find(params.fetch("prefill_with_id"))

    render("building_amenity_templates/edit_form.html.erb")
  end

  def update_row
    @building_amenity = BuildingAmenity.find(params.fetch("id_to_modify"))

    @building_amenity.building_id = params.fetch("building_id")
    @building_amenity.amenity_id = params.fetch("amenity_id")

    if @building_amenity.valid?
      @building_amenity.save

      redirect_to("/building_amenities/#{@building_amenity.id}", :notice => "Building amenity updated successfully.")
    else
      render("building_amenity_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_amenity
    @building_amenity = BuildingAmenity.find(params.fetch("id_to_remove"))

    @building_amenity.destroy

    redirect_to("/amenities/#{@building_amenity.amenity_id}", notice: "BuildingAmenity deleted successfully.")
  end

  def destroy_row_from_building
    @building_amenity = BuildingAmenity.find(params.fetch("id_to_remove"))

    @building_amenity.destroy

    redirect_to("/buildings/#{@building_amenity.building_id}", notice: "BuildingAmenity deleted successfully.")
  end

  def destroy_row
    @building_amenity = BuildingAmenity.find(params.fetch("id_to_remove"))

    @building_amenity.destroy

    redirect_to("/building_amenities", :notice => "Building amenity deleted successfully.")
  end
end
