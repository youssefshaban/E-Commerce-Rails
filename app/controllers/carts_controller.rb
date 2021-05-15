class CartsController < ApplicationController
  before_action :authenticate_buyer!
  before_action :set_cart, only: %i[show edit update destroy]

  # GET /carts or /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1 or /carts/1.json
  def show
    @cart = Cart.find_by(buyer_id:current_buyer.id)
    @entries = CartCarry.where(cart_id:@cart.id)
    # puts @entries

  end

  # GET /carts/new
  def new  
    @cart = Cart.find_by(buyer_id:current_buyer.id)
    @p = Product.find_by(id:params[:product])
    session[:passed_variable] = @p.id

    if params[:quantity] != nil
      session[:edited_Quantity] = params[:quantity]
      puts "YO"
    else
      puts "NOO"
    end
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts or /carts.json
  def create
    # @cart = Cart.new(cart_params)

    # respond_to do |format|
    #   if @cart.save
    #     format.html { redirect_to @cart, notice: "Cart was successfully created." }
    #     format.json { render :show, status: :created, location: @cart }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @cart.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /carts/1 or /carts/1.json
  def update
    puts "I AM HEEEERE"
    @first_value = session[:passed_variable] 
    @get_value = @first_value
    @p = Product.find_by(id:@get_value)



    puts @p.name 
    puts cart_params["quantity"]
    puts "I AM HEEEERE"
    
    
    if cart_params["quantity"].to_i > @p.quantity
      puts "LAAAAAAAAAAAAAA"
      flash.now[:error] = "please fix the problems in the record"
    else
        @cart = Cart.find_by(buyer_id:current_buyer.id)
        @editing_Quantity = session[:edited_Quantity]
        if @editing_Quantity != nil
          @entry = CartCarry.find_by(cart_id:@cart.id , product_id:@p.id)
          @entry.quantity = cart_params["quantity"].to_i
          @entry.save
        else
          @entry = CartCarry.create(cart_id:@cart.id,product_id:@p.id,quantity: cart_params["quantity"].to_i)
          Rails.logger.info(@entry.errors.inspect) 
          puts "AYWAAAAAAAAAAAA"
        end
        redirect_to cart_path
    end



    # respond_to do |format|
    #   if @cart.update(cart_params)
    #     format.html { redirect_to @cart, notice: "Cart was successfully updated." }
    #     format.json { render :show, status: :ok, location: @cart }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @cart.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: "Cart was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.require(:cart).permit(:quantity)
    end
    # def addToCart
    #     params.permit(:quantity)
    # end
end
