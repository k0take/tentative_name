class ProductsController < ApplicationController
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

  private

  def product_params
    params.require(:product).permit(:product_name, :store_name, :regular_price, :discounted_price)
  end
end
