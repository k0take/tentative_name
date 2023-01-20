class ProductsController < ApplicationController
  before_action :find_product, only: [:edit, :update, :destroy]

  def index
    @category_list = Category.all
    if params[:category_id].nil?
      @products = Product
    else
      @category = Category.find(params[:category_id])
      @products = @category.products
    end
    @products = Product.where(user_id: current_user.id).includes(:user).order(created_at: :desc)
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.build(product_params)
    category_list = params[:product][:name].split(',')
    if @product.save
      @product.save_category(category_list)
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
    @category_list=@product.categories.pluck(:name).join(',')
  end

  def update
    @product = current_user.products.find(params[:id])
    @category_list=params[:product][:name].split(',')
    if @product.update(product_params)
      @product.save_category(@category_list)
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
    params.require(:product).permit(:product_name, :store_name, :regular_price, :discounted_price, category_ids: [])
  end

  def find_product
    @product = current_user.products.find(params[:id])
  end
end
