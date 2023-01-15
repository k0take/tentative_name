class Product < ApplicationRecord
  belongs_to :user
  has_many :product_stores

  validates :product_name, presence: true, uniqueness: true
  validates :store_name, presence: true
  validates :regular_price, presence: true
  validates :discounted_price, presence: true
end
