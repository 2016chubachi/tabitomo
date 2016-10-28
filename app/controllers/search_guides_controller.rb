class SearchGuidesController < ApplicationController
  def index
    @search_guide = Search::Guide.new(search_params)
    @city_masters = CityMaster.all
    if params[:nav_search]
      # nav barからの検索
      @guides = @search_guide.selectByNavbar
    else
      # 検索ページでの検索
      @guides = @search_guide.selectBySearch
    end
  end



  private  
  
  def search_params
    params
      .require(:search_guide)
      .permit(Search::Guide::ATTRIBUTES)
  end
end
