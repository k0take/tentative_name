class Category < ApplicationRecord
  has_many :product_categories, dependent: :destroy, foreign_key: 'category_id'
  has_many :products, through: :product_categories

  validates :category_name, uniqueness: true
end
