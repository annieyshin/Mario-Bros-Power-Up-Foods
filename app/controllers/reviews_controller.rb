class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
    @product = @review.product
  end

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      redirect_to product_reviews_path(@review.product)
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])

  end

  def update
    @review= Review.find(params[:id])
    if @review.update(review_params)
      redirect_to product_path(@review.product)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path(@review.product)
  end

  private
  def review_params
    params.require(:review).permit(:description, :rating)
  end

end
