class AiToolsController < ApplicationController

  # View for all the AI tools
  def index
    @ai_tools = AiTool.paginate(page: params[:page], per_page: 25)
  end

  # View for a specific AI tool
  def show
    @ai_tool = AiTool.find(params[:id])
  end

  # Creating a new AI tool
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
      redirect_to ai_tool_path(@ai_tool.id), notice: "Successfully Created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @ai_tool = AiTool.find(params[:id])
    @categories = Category.order(:category).map { |category| [category.category, category.id] }
    @prices = Price.order(:price).map { |price| [price.price, price.id] }
  end

  def update
    @ai_tool = AiTool.find(params[:id])
    @categories = Category.order(:category).map { |category| [category.category, category.id] }
    @prices = Price.order(:price).map { |price| [price.price, price.id] }
    if @ai_tool.update(ai_tool_params)
      redirect_to ai_tool_path(@ai_tool.id), notice: "Successfully Updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @ai_tool = AiTool.find(params[:id])
    @ai_tool.destroy
    redirect_to root_path, status: :see_other
  end

  private
  def ai_tool_params
    params.require(:ai_tool).permit(:name, :description, :link, :category_id, :price_id)
  end

end
