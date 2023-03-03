class Product < ApplicationRecord
  belongs_to :user
  has_many :product_stores
  has_many :stores, through: :product_stores
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories

  validates :name, presence: true

  accepts_nested_attributes_for :product_stores

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["categories", "product_categories", "product_stores", "stores", "user"]
  end

  def save_category(category_list)
    current_categories = self.categories.pluck(:category_name) unless self.categories.nil?
    old_categories = current_categories - category_list
    new_categories = category_list - current_categories

    old_categories.each do |old|
      self.categories.delete Category.find_by(category_name: old)
    end

    new_categories.each do |new|
      new_product_category = Category.find_or_create_by(category_name: new)
      self.categories << new_product_category
    end
  end
end
