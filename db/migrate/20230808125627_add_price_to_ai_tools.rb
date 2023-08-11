class AddPriceToAiTools < ActiveRecord::Migration[7.0]
  def change
    add_reference :ai_tools, :price, null: true, foreign_key: true,after: :category_id
  end
end
