class SearchbarsController < ApplicationController

  def index
    @search_results = AiTool.where("name LIKE ?", AiTool.sanitize_sql_like(params[:search]) + "%")
    if @search_results.blank?
      flash[:message] = "No results found."
    end
  end

  private
  def searchbar_params
    params.require(:ai_tool).permit(:search)
  end
end
