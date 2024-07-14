class Seller::OrdersController < SellerController
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /sellers/orders or /sellers/orders.json
  def index
    @orders = Order.all
  end

  # GET /sellers/orders/1 or /sellers/orders/1.json
  def show
  end

  # GET /sellers/orders/new
  def new
    @order = Order.new
  end

  # GET /sellers/orders/1/edit
  def edit
  end

  # POST /sellers/orders or /sellers/orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sellers/orders/1 or /sellers/orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sellers/orders/1 or /sellers/orders/1.json
  def destroy
    @order.destroy!

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:customer_email, :product_quantity, :total_price, :status, :shipping_address, :customer_name, :customer_phone)
    end
end
