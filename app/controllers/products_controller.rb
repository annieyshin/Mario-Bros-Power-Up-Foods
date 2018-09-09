class ProductsController < ApplicationController
  def index
    @products = Project.all
    render :index
  end
end
