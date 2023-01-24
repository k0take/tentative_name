class Product < ApplicationRecord
  belongs_to :user
  has_many :product_stores
  has_many :stores, through: :product_stores
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories, dependent: :destroy

  accepts_nested_attributes_for :product_stores, reject_if: :all_blank

  validates :name, presence: true
end
