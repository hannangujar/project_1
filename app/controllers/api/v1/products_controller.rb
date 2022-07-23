class Api::V1::ProductsController < ApiController
  
  before_action :set_book, only: %i[show edit update destroy]
  
    def index
      @products = Product.all
      render json: @products
      end
    end
  
    def show
    end

    def new
      @product = Product.new
    end

    def edit
    end
  
    def create
      @product = Product.new(product_params)
  
      if @product.save
        render json: @product, status: :created, location: @product
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @product.update(product_params)
        render json: @product
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @product.destroy
      respond_to do |format|
        format.html { redirect_to books_url, notice: 'Product was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
  
    private
      def set_product
        @product = Product.find(params[:id])
      end
  
      def product_params
        params.require(:product).permit(:name, :title, :discription, :price, :image_path, :company_id)
      end