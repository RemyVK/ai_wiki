class CategoryPagesController < ApplicationController
  def index
      @categories = Category.where.not(category: nil).select(:id, :category)
  end

  def show
    @category = Category.find(params[:id])
    @ai_tools = AiTool.includes(:category).where(category_id: @category.id).paginate(page: params[:page], per_page: 25)
  end
end
