class ApartmentBookmarksController < ApplicationController
  def index
    @apartment_bookmarks = ApartmentBookmark.page(params[:page]).per(10)

    render("apartment_bookmark_templates/index.html.erb")
  end

  def show
    @apartment_bookmark = ApartmentBookmark.find(params.fetch("id_to_display"))

    render("apartment_bookmark_templates/show.html.erb")
  end

  def new_form
    @apartment_bookmark = ApartmentBookmark.new

    render("apartment_bookmark_templates/new_form.html.erb")
  end

  def create_row
    @apartment_bookmark = ApartmentBookmark.new

    @apartment_bookmark.user_id = params.fetch("user_id")
    @apartment_bookmark.apartment_id = params.fetch("apartment_id")
    @apartment_bookmark.name = params.fetch("name")

    if @apartment_bookmark.valid?
      @apartment_bookmark.save

      redirect_back(:fallback_location => "/apartment_bookmarks", :notice => "Apartment bookmark created successfully.")
    else
      render("apartment_bookmark_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_apartment
    @apartment_bookmark = ApartmentBookmark.new

    @apartment_bookmark.user_id = params.fetch("user_id")
    @apartment_bookmark.apartment_id = params.fetch("apartment_id")
    @apartment_bookmark.name = params.fetch("name")

    if @apartment_bookmark.valid?
      @apartment_bookmark.save

      redirect_to("/apartments/#{@apartment_bookmark.apartment_id}", notice: "ApartmentBookmark created successfully.")
    else
      render("apartment_bookmark_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @apartment_bookmark = ApartmentBookmark.find(params.fetch("prefill_with_id"))

    render("apartment_bookmark_templates/edit_form.html.erb")
  end

  def update_row
    @apartment_bookmark = ApartmentBookmark.find(params.fetch("id_to_modify"))

    @apartment_bookmark.user_id = params.fetch("user_id")
    @apartment_bookmark.apartment_id = params.fetch("apartment_id")
    @apartment_bookmark.name = params.fetch("name")

    if @apartment_bookmark.valid?
      @apartment_bookmark.save

      redirect_to("/apartment_bookmarks/#{@apartment_bookmark.id}", :notice => "Apartment bookmark updated successfully.")
    else
      render("apartment_bookmark_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @apartment_bookmark = ApartmentBookmark.find(params.fetch("id_to_remove"))

    @apartment_bookmark.destroy

    redirect_to("/users/#{@apartment_bookmark.user_id}", notice: "ApartmentBookmark deleted successfully.")
  end

  def destroy_row_from_apartment
    @apartment_bookmark = ApartmentBookmark.find(params.fetch("id_to_remove"))

    @apartment_bookmark.destroy

    redirect_to("/apartments/#{@apartment_bookmark.apartment_id}", notice: "ApartmentBookmark deleted successfully.")
  end

  def destroy_row
    @apartment_bookmark = ApartmentBookmark.find(params.fetch("id_to_remove"))

    @apartment_bookmark.destroy

    redirect_to("/apartment_bookmarks", :notice => "Apartment bookmark deleted successfully.")
  end
end
