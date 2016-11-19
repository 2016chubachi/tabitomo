class GuidesController < ApplicationController

  def show
    #ガイド登録画面はmy page,自分のuserid and emailaddressは変更できない
    #binding.pry
    @guide = Guide.find(params[:id])

  end

  def new
    @guide = Guide.new
  end

  def update
    @guide = Guide.find(params[:id])

    if @guide.update(guide_params)
      redirect_to @guide
    else
      render 'edit'
    end
  end

  def edit
    @guide = Guide.find(params[:id])
  end

  def create
    @guide = Guide.new(guide_params)

    @guide.save
    redirect_to @guide

    #render plain: params[:guide].inspect
  end

  private
    def guide_params
      params.require(:guide).permit(
              :profile, :guide_service, :guide_transportation,
              :guide_interest, :experience, :license_flg,:birth_year,
              #licence_pictures_attributes: [:id, :photo],
              member_attributes: [:gender, :first_name, :last_name,:telphone,:country_id]
       )
      end
end
