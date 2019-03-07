class ApartmentCommentsController < ApplicationController
  def index
    @q = ApartmentComment.ransack(params[:q])
    @apartment_comments = @q.result(:distinct => true).includes(:user, :apartment).page(params[:page]).per(10)

    render("apartment_comment_templates/index.html.erb")
  end

  def show
    @apartment_comment = ApartmentComment.find(params.fetch("id_to_display"))

    render("apartment_comment_templates/show.html.erb")
  end

  def new_form
    @apartment_comment = ApartmentComment.new

    render("apartment_comment_templates/new_form.html.erb")
  end

  def create_row
    @apartment_comment = ApartmentComment.new

    @apartment_comment.user_id = params.fetch("user_id")
    @apartment_comment.apartment_id = params.fetch("apartment_id")
    @apartment_comment.text = params.fetch("text")

    if @apartment_comment.valid?
      @apartment_comment.save

      redirect_back(:fallback_location => "/apartment_comments", :notice => "Apartment comment created successfully.")
    else
      render("apartment_comment_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_apartment
    @apartment_comment = ApartmentComment.new

    @apartment_comment.user_id = params.fetch("user_id")
    @apartment_comment.apartment_id = params.fetch("apartment_id")
    @apartment_comment.text = params.fetch("text")

    if @apartment_comment.valid?
      @apartment_comment.save

      redirect_to("/apartments/#{@apartment_comment.apartment_id}", notice: "ApartmentComment created successfully.")
    else
      render("apartment_comment_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @apartment_comment = ApartmentComment.find(params.fetch("prefill_with_id"))

    render("apartment_comment_templates/edit_form.html.erb")
  end

  def update_row
    @apartment_comment = ApartmentComment.find(params.fetch("id_to_modify"))

    @apartment_comment.user_id = params.fetch("user_id")
    @apartment_comment.apartment_id = params.fetch("apartment_id")
    @apartment_comment.text = params.fetch("text")

    if @apartment_comment.valid?
      @apartment_comment.save

      redirect_to("/apartment_comments/#{@apartment_comment.id}", :notice => "Apartment comment updated successfully.")
    else
      render("apartment_comment_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @apartment_comment = ApartmentComment.find(params.fetch("id_to_remove"))

    @apartment_comment.destroy

    redirect_to("/users/#{@apartment_comment.user_id}", notice: "ApartmentComment deleted successfully.")
  end

  def destroy_row_from_apartment
    @apartment_comment = ApartmentComment.find(params.fetch("id_to_remove"))

    @apartment_comment.destroy

    redirect_to("/apartments/#{@apartment_comment.apartment_id}", notice: "ApartmentComment deleted successfully.")
  end

  def destroy_row
    @apartment_comment = ApartmentComment.find(params.fetch("id_to_remove"))

    @apartment_comment.destroy

    redirect_to("/apartment_comments", :notice => "Apartment comment deleted successfully.")
  end
end
