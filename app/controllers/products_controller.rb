class ProductsController < ApplicationController
  before_action :set_store_list, only: %i[new create show edit update]
  before_action :find_product, only: [:edit, :update, :destroy]

  def index
    @products = Product.where(user_id: current_user.id).includes(:user).order(created_at: :desc)
  end

  def new
    @product = Product.new

    1.times do
      @product.product_stores.build
    end
  end

  def create
    @product = current_user.products.build(product_params)
    if @product.save
      redirect_to products_path, success: t('defaults.message.register', item: Product.model_name.human)
    else
      flash.now[:alert] = t('defaults.message.not_register', item: Product.model_name.human)
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = current_user.products.find(params[:id])
  end

  def update
    @product = current_user.products.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path, success: t('defaults.message.updated', item: Product.model_name.human)
    else
      flash.now[:alert] = t('defaults.message.not_updated', item: Product.model_name.human)
      render :edit
    end
  end

  def destroy
    @product.destroy!
    redirect_to products_path, success: t('defaults.message.deleted', item: Product.model_name.human)
  end

  private

  def product_params
    params.require(:product).permit(:name,
                                    product_stores_attributes: [
                                      :id,
                                      :store_id,
                                      :new_store_name,
                                      :regular_price,
                                      :discounted_price,
                                    ])
  end

  def find_product
    @product = current_user.products.find(params[:id])
  end

  # セレクトボックスの選択肢
  def set_store_list
    @store_list = [
      ['選択してください', nil],
      *Store.all.pluck(:name, :id),
      ['(新規 store を登録)', 'new-store'],
    ]
  end
end
