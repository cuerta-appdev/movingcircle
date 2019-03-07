class PackBookmarksController < ApplicationController
  def index
    @q = PackBookmark.ransack(params[:q])
    @pack_bookmarks = @q.result(:distinct => true).includes(:user, :pack).page(params[:page]).per(10)

    render("pack_bookmark_templates/index.html.erb")
  end

  def show
    @pack_bookmark = PackBookmark.find(params.fetch("id_to_display"))

    render("pack_bookmark_templates/show.html.erb")
  end

  def new_form
    @pack_bookmark = PackBookmark.new

    render("pack_bookmark_templates/new_form.html.erb")
  end

  def create_row
    @pack_bookmark = PackBookmark.new

    @pack_bookmark.user_id = params.fetch("user_id")
    @pack_bookmark.pack_id = params.fetch("pack_id")
    @pack_bookmark.name = params.fetch("name")

    if @pack_bookmark.valid?
      @pack_bookmark.save

      redirect_back(:fallback_location => "/pack_bookmarks", :notice => "Pack bookmark created successfully.")
    else
      render("pack_bookmark_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_furniture_pack
    @pack_bookmark = PackBookmark.new

    @pack_bookmark.user_id = params.fetch("user_id")
    @pack_bookmark.pack_id = params.fetch("pack_id")
    @pack_bookmark.name = params.fetch("name")

    if @pack_bookmark.valid?
      @pack_bookmark.save

      redirect_to("/furniture_packs/#{@pack_bookmark.pack_id}", notice: "PackBookmark created successfully.")
    else
      render("pack_bookmark_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @pack_bookmark = PackBookmark.find(params.fetch("prefill_with_id"))

    render("pack_bookmark_templates/edit_form.html.erb")
  end

  def update_row
    @pack_bookmark = PackBookmark.find(params.fetch("id_to_modify"))

    @pack_bookmark.user_id = params.fetch("user_id")
    @pack_bookmark.pack_id = params.fetch("pack_id")
    @pack_bookmark.name = params.fetch("name")

    if @pack_bookmark.valid?
      @pack_bookmark.save

      redirect_to("/pack_bookmarks/#{@pack_bookmark.id}", :notice => "Pack bookmark updated successfully.")
    else
      render("pack_bookmark_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @pack_bookmark = PackBookmark.find(params.fetch("id_to_remove"))

    @pack_bookmark.destroy

    redirect_to("/users/#{@pack_bookmark.user_id}", notice: "PackBookmark deleted successfully.")
  end

  def destroy_row_from_pack
    @pack_bookmark = PackBookmark.find(params.fetch("id_to_remove"))

    @pack_bookmark.destroy

    redirect_to("/furniture_packs/#{@pack_bookmark.pack_id}", notice: "PackBookmark deleted successfully.")
  end

  def destroy_row
    @pack_bookmark = PackBookmark.find(params.fetch("id_to_remove"))

    @pack_bookmark.destroy

    redirect_to("/pack_bookmarks", :notice => "Pack bookmark deleted successfully.")
  end
end
