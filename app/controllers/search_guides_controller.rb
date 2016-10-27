class SearchGuidesController < ApplicationController
  def index
    @search_guide = Search::Guide.new(search_params)
    @city_masters = CityMaster.all
    @guides = ::Guide.all
  end



  private  
  
  def search_params
    params
      .require(:search_guide)
      .permit(Search::Guide::ATTRIBUTES)
  end
end
