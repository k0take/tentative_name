class ProductsController < ApplicationController
  before_action :find_product, only: [:edit, :update, :destroy]

  def index
    @products = Product.where(user_id: current_user.id).includes(:user).order(created_at: :desc)
  end

  def new
    @product = Product.new
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

  def edit; end

  def update
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
    params.require(:product).permit(:product_name, :store_name, :regular_price, :discounted_price)
  end

  def find_product
    @product = current_user.products.find(params[:id])
  end
end
