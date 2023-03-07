class Store < ApplicationRecord
  has_many :product_stores
  has_many :products, through: :product_stores

  validates :name, uniqueness: true, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "updated_at"]
  end
end
