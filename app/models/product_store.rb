class ProductStore < ApplicationRecord
  attr_reader :new_store_name

  belongs_to :product
  belongs_to :store

  validates :regular_price, presence: true
  validates :discounted_price, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "discounted_price", "id", "product_id", "regular_price", "store_id", "updated_at"]
  end

  def new_store_name=(name)
    build_store(id: nil, name: name) if name.present?
    @new_store_name = name
  end
end
