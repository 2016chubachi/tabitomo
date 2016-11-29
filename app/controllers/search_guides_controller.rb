class SearchGuidesController < ApplicationController
  def index
    @city_masters = CityMaster.all
    if params[:nav_search]
      # nav barからの検索
      @search_guide = Search::Guide.new(search_params)
      @guides = @search_guide.selectByNavbar
    elsif params[:main_search]
      # 検索ページでの検索
      @search_guide = Search::Guide.new(search_params)
      @guides = @search_guide.selectBySearch
    elsif params[:sp_search]
      # indexページからの検索
      @search_guide = Search::Guide.new
      @search_guide.city = params[:city]
      @guides = @search_guide.selectByIndex
    end
    unless @guides.present?
      flash.now[:notice] = "お探しのガイドはいません！"
    end
  end



  private  
  
  def search_params
    params
      .require(:search_guide)
      .permit(Search::Guide::ATTRIBUTES)
  end
end
