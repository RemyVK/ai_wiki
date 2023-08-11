class AddCategoryToAiTools < ActiveRecord::Migration[7.0]
  def change
    add_reference :ai_tools, :category, null: true, foreign_key: true,after: :id
  end
end
