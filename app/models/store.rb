class Store < ApplicationRecord
  has_many :product_stores
  has_many :Products, through: :product_stores
end
