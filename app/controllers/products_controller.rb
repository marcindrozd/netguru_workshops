class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :require_owner, only: [:edit, :update, :destroy]

  expose(:category)
  expose(:products)
  expose(:product)
  expose(:review) { Review.new }
  expose_decorated(:reviews, ancestor: :product)

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    self.product = Product.new(product_params)

    if product.save
      category.products << product
      flash["notice"] = "Product was successfully created."
      redirect_to category_product_url(category, product)
    else
      render template: '/categories/show'
    end
  end

  def update
    if self.product.update(product_params)
      flash["notice"] = "Product was successfully updated."
      redirect_to category_product_url(category, product)
    else
      render action: 'edit'
    end
  end

  def destroy
    product.destroy
    flash["notice"] = 'Product was successfully destroyed.'
    redirect_to category_url(product.category)
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :category_id)
  end

  def require_owner
    if (current_user != product.user && !current_user.admin?)
      flash[:error] = 'You are not allowed to edit this product.'
      redirect_to category_product_url(category, product)
    end
  end
end
