class CreateAiTools < ActiveRecord::Migration[7.0]
  def change
    create_table :ai_tools do |t|
      t.string :name
      t.text :description
      t.string :link, limit: 1500

      t.timestamps
    end
  end
end
