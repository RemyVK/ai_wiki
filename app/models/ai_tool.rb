class AiTool < ApplicationRecord
  belongs_to :category
  belongs_to :price

  validates :name, :description, :link, :category_id, :price_id, presence: true
  
end