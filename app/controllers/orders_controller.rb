class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]

  # GET /orders or /orders.json
  def index
    # if current_buyer.id != Nil
      @orders = Order.where(buyer_id:current_buyer.id)
    # else 
    #   @orders = Order.where(buyer_id:current_buyer.id)
  end

  # GET /orders/1 or /orders/1.json
  def show
    @items = Product.where(id:@order.OrderItems.ids)
  end

# GET /oders/seller
  def seller
    @orders = Order.all
    @myOrders = Array.new
    @orders.each do |item|
      # new array to save the seller orders 
      @myOrderItems = Array.new

       item.OrderItems.each do |i2|
        puts i2.seller_id
        puts current_seller.id
        if i2.seller_id == current_seller.id
        @myOrders.push(item)
        end
       end 
  end

   # @items = Product.where(id:@order.OrderItems.ids)
  end
  def accept 
    puts "accept"
    @OrderState = 1
    @order = Order.find(params[:id])
    @order.OrderItems.each do |i2|
      if i2.seller_id == current_seller.id
      i2.update(state:"accepted")
      end
      if i2.state != "accepted"
        @OrderState = 0
      end 
     end 
     # check if all orders accepted 
     if @OrderState == 1
    @order.update(state:"done")
     end 
  end
  def reject 
    # @items = Product.where(id:@order.OrderItems.ids)
    puts "reject"
    @order = Order.find(params[:id])
    @order.OrderItems.each do |i2|
      if i2.seller_id == current_seller.id
      i2.update(state:"rejected")
      end
     end 
    @order.update(state:"done")
  end
  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy
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
    params.require(:order).permit(:state, :buyer_id)
  end
end
