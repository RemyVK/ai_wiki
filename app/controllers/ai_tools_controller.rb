class AiToolsController < ApplicationController

  #View for all the AI tools
  def index
    @ai_tools = AiTool.all
  end

  #View for a specific AI tool
  def show
    @ai_tool = AiTool.find(params[:id])
  end

  #Creating a new AI tool
  def new
    @ai_tool = AiTool.new
    @categories = Category.order(:category).map { |category| [category.category, category.id] }
    @prices = Price.order(:price).map { |price| [price.price, price.id] }
    end

  def create
    @ai_tool = AiTool.new(ai_tool_params)
    @categories = Category.order(:category).map { |category| [category.category, category.id] }
    @prices = Price.order(:price).map { |price| [price.price, price.id] }

    if @ai_tool.save
      redirect_to ai_tool_path(@ai_tool.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def ai_tool_params
    params.require(:ai_tool).permit(:name, :description, :link, :category_id, :price_id)
  end

end
