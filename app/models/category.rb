class Category < ApplicationRecord
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories, dependent: :destroy

  validates :category_name, uniqueness: true
end
