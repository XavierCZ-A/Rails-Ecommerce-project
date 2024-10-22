class Seller::ProductsController < SellerController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /seller/products or /seller/products.json
  def index
    @products = current_user.products

    if params[:category_id]
      @products = @products.where(category_id: params[:category_id])
    end

    if params[:min_price].present?
      @products = @products.where("price >= ?", params[:min_price])
    end

    if params[:max_price].present?
      @products = @products.where("price <= ?", params[:max_price])
    end

    if params[:query_text].present?
      @products = @products.search_full_text(params[:query_text])
    end

    orders = Product::ORDER_BY.fetch(params[:order_by]&.to_sym, Product::ORDER_BY[:newest])

    # We check if the parameter exists with &
    @products = @products.order(orders)
  end

  # GET /seller/products/1 or /seller/products/1.json
  def show
  end

  # GET /seller/products/new
  def new
    @product = Product.new
  end

  # GET /seller/products/1/edit
  def edit
  end

  # POST /seller/products or /seller/products.json
  def create
    # @product = Product.new(product_params)
    @product = current_user.products.new(product_params)
    if @product.save
      redirect_to product_url(@product), notice: "Product was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /seller/products/1 or /seller/products/1.json
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params.reject { |k| k["images"] })
      if product_params[:images]
        product_params[:images].each do |image|
          @product.images.attach(image)
        end
      end
      redirect_to product_url(@product), notice: "Product was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /seller/products/1 or /seller/products/1.json
  def destroy
    @product.destroy!
    redirect_to products_url, notice: "Product was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:title, :description, :price, :category_id, images: [])
  end
end
