class Api::V1::Android::ProductsController < ApiController
    include ApplicationHelper
    before_action :set_product, only: %i[show]
    before_action :is_admin?
  
    def index
      @products = Product.all
      render json: @products
    end
  
    def show
      render json: @product
    end
  
    private

    def set_book
      @product = Product.find(params[:id])
    end
  
    def product_params
      params.require(:product)
    end
  end