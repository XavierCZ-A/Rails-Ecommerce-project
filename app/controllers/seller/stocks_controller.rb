class Seller::StocksController < SellerController
  before_action :set_stock, only: %i[ show edit update destroy ]

  # GET /sellers/stocks or /sellers/stocks.json
  def index
    @stocks = Stock.all
  end

  # GET /sellers/stocks/1 or /sellers/stocks/1.json
  def show
  end

  # GET /sellers/stocks/new
  # inicializa el nuevo stock con el product_id que se pasa en los parámetros:
  def new
    if params[:product_id].present?
      @stock = Stock.new(product_id: params[:product_id])
    else
      @stock = Stock.new
    end
  end

  # GET /sellers/stocks/1/edit
  def edit
  end

  # POST /sellers/stocks or /sellers/stocks.json
  def create
    @stock = Stock.new(stock_params)

    respond_to do |format|
      if @stock.save
        format.html { redirect_to stock_url(@stock), notice: "Stock was successfully created." }
        format.json { render :show, status: :created, location: @stock }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sellers/stocks/1 or /sellers/stocks/1.json
  def update
    respond_to do |format|
      if @stock.update(stock_params)
        format.html { redirect_to stock_url(@stock), notice: "Stock was successfully updated." }
        format.json { render :show, status: :ok, location: @stock }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sellers/stocks/1 or /sellers/stocks/1.json
  def destroy
    @stock.destroy!

    respond_to do |format|
      format.html { redirect_to stocks_url, notice: "Stock was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = Stock.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stock_params
      params.require(:stock).permit(:quantity, :product_id)
    end
end
