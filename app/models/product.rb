class Product < ApplicationRecord
  belongs_to :user
  has_many :product_stores
  has_many :stores, through: :product_stores
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories, dependent: :destroy

  accepts_nested_attributes_for :product_stores, reject_if: :all_blank

  validates :name, presence: true

  def save_category(category_list)
    current_categories = self.categories.pluck(:name) unless self.categories.nil?
    old_categories = current_categories - category_list
    new_categories = category_list - current_categories

    old_categories.each do |old|
      self.categories.delete Category.find_by(name: old)
    end

    new_categories.each do |new|
      new_product_category = Category.find_or_create_by(name: new)
      self.categories << new_product_category
    end
  end
end
