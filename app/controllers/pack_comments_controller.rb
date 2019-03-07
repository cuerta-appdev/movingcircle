class PackCommentsController < ApplicationController
  def index
    @q = PackComment.ransack(params[:q])
    @pack_comments = @q.result(:distinct => true).includes(:user, :pack).page(params[:page]).per(10)

    render("pack_comment_templates/index.html.erb")
  end

  def show
    @pack_comment = PackComment.find(params.fetch("id_to_display"))

    render("pack_comment_templates/show.html.erb")
  end

  def new_form
    @pack_comment = PackComment.new

    render("pack_comment_templates/new_form.html.erb")
  end

  def create_row
    @pack_comment = PackComment.new

    @pack_comment.furniture_pack_id = params.fetch("furniture_pack_id")
    @pack_comment.user_id = params.fetch("user_id")

    if @pack_comment.valid?
      @pack_comment.save

      redirect_back(:fallback_location => "/pack_comments", :notice => "Pack comment created successfully.")
    else
      render("pack_comment_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_furniture_pack
    @pack_comment = PackComment.new

    @pack_comment.furniture_pack_id = params.fetch("furniture_pack_id")
    @pack_comment.user_id = params.fetch("user_id")

    if @pack_comment.valid?
      @pack_comment.save

      redirect_to("/furniture_packs/#{@pack_comment.furniture_pack_id}", notice: "PackComment created successfully.")
    else
      render("pack_comment_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @pack_comment = PackComment.find(params.fetch("prefill_with_id"))

    render("pack_comment_templates/edit_form.html.erb")
  end

  def update_row
    @pack_comment = PackComment.find(params.fetch("id_to_modify"))

    @pack_comment.furniture_pack_id = params.fetch("furniture_pack_id")
    @pack_comment.user_id = params.fetch("user_id")

    if @pack_comment.valid?
      @pack_comment.save

      redirect_to("/pack_comments/#{@pack_comment.id}", :notice => "Pack comment updated successfully.")
    else
      render("pack_comment_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @pack_comment = PackComment.find(params.fetch("id_to_remove"))

    @pack_comment.destroy

    redirect_to("/users/#{@pack_comment.user_id}", notice: "PackComment deleted successfully.")
  end

  def destroy_row_from_pack
    @pack_comment = PackComment.find(params.fetch("id_to_remove"))

    @pack_comment.destroy

    redirect_to("/furniture_packs/#{@pack_comment.furniture_pack_id}", notice: "PackComment deleted successfully.")
  end

  def destroy_row
    @pack_comment = PackComment.find(params.fetch("id_to_remove"))

    @pack_comment.destroy

    redirect_to("/pack_comments", :notice => "Pack comment deleted successfully.")
  end
end
