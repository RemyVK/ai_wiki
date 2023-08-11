class AiTool < ApplicationRecord
  belongs_to :category
  belongs_to :price

  validates :name, presence: true
  validates :description, presence: true
  validates :link, presence: true
  validates :category, presence: true
  validates :price, presence: true
end

