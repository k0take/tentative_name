class ProductStore < ApplicationRecord
  attr_reader :new_store_name

  belongs_to :product
  belongs_to :store

  def new_store_name=(name)
    build_store(id: nil, name: name) if name.present?
    @new_store_name = name
  end
end
