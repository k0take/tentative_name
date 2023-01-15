class Store < ApplicationRecord
  has_many :product_stores

  validates :name, uniqueness: true
end
