class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_owner, only: [:edit, :destroy]

  expose(:review)
  expose(:product)
  expose(:category)
  expose_decorated(:reviews, ancestor: :product)

  def edit
  end

  def create
    self.review = current_user.reviews.new(review_params)

    if review.save
      product.reviews << review
      flash["notice"] = 'Review was successfully created.'
      redirect_to category_product_url(product.category, product)
    else
      flash.now[:danger] = "There is something missing in your review!"
      render template: 'products/show'
    end
  end

  def destroy
    review.destroy
    flash["notice"] = 'Review was successfully destroyed.'
    redirect_to category_product_url(product.category, product)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def require_owner
    if (current_user != review.user && !current_user.admin?)
      flash[:error] = "You are not allowed to do that!"
      redirect_to category_product_url(product.category, product)
    end
  end
end
