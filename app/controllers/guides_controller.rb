class GuidesController < ApplicationController

  def show
    #ガイド登録画面はmy page,自分のuserid and emailaddressは変更できない
    #binding.pry
    @guide = Guide.find(params[:id])

  end

  def new
    @guide = Guide.new
  end

  def edit
    @guide = Guide.find(params[:id])
    @guide.licence_pictures.build
  end
  #binding.pry

  #すでに登録済みの画像は全て削除して、新しくアップロードする画像に差し替えるようにする。
  def update
    @guide = Guide.find(params[:id])
    respond_to do |format|
      if @guide.update(guide_params)

          # 画像のアップロード対応
          if params[:photo]
          # 前回登録してある画像は全て削除
             Guide.find(params[:id]).licence_pictures.each do |l_img|
                 l_img.destroy
             end
          # 代わりに今回アップする画像に差し替え
          params[:photo].each { |new_img|
              @guide.licence_pictures.create(photo: new_img)
              }
          end
        format.html { redirect_to @guide, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @guide }
      else
        format.html { render :edit }
        format.json { render json: @guide.errors, status: :unprocessable_entity }
      end
    end
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
                  licence_pictures_attributes: [:id, :photo],
                  member_attributes: [:gender, :first_name, :last_name,:telphone,:country_id]
           )
    end

end
