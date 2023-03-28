class Category < ApplicationRecord
  has_many :product_categories, dependent: :destroy
  has_many :products, through: :product_categories

  validates :category_name, uniqueness: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[category_name created_at id updated_at]
  end
end
