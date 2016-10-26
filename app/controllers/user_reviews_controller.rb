class UserReviewsController < ApplicationController
  def index
  end

  def show
    @UserReview = UserReview.find(params[:id])
    if params[:format].in?(["jpg","png","gif"])
      send_star
    else
      render "show"
    end
  end

  def new
    @UserReview = UserReview.new
  end

  def create
    @UserReview = UserReview.new(user_review_params)
    if @UserReview.save
      redirect_to @UserReview
    else
      render "new"
    end
  end

  def edit
    @UserReview = UserReview.find(params[:id])
  end

  def update
    @UserReview = UserReview.find(params[:id])
    # @UserReview.assign_attributes(params[:user_review])
    @UserReview.assign_attributes(user_review_params)
    if @UserReview.save
      redirect_to @UserReview
    else
      render "edit"
    end
  end

  def destroy
    @UserReview = UserReview.find(params[:id])
    @UserReview.destroy
    # new画面にリダイレクトする
    redirect_to new_user_review_path
  end

  private
  def user_review_params
    params.require(:user_review).permit(:star_master_id, :title, :detail)
  end

  def send_star
    send_data @UserReview.star_master.image, type: @UserReview.star_master.pictype, disposition: "inline"
  end

end
