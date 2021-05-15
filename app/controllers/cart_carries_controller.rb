class CartCarriesController < ApplicationController
  before_action :set_cart_carry, only: %i[ show edit update destroy ]

  # GET /cart_carries or /cart_carries.json
  def index
    @cart_carries = CartCarry.all
  end

  # GET /cart_carries/1 or /cart_carries/1.json
  def show
  end

  # GET /cart_carries/new
  def new
    @cart_carry = CartCarry.new
  end

  # GET /cart_carries/1/edit
  def edit
  end

  # POST /cart_carries or /cart_carries.json
  def create
    @cart_carry = CartCarry.new(cart_carry_params)

    respond_to do |format|
      if @cart_carry.save
        format.html { redirect_to @cart_carry, notice: "Cart carry was successfully created." }
        format.json { render :show, status: :created, location: @cart_carry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cart_carry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cart_carries/1 or /cart_carries/1.json
  def update
    respond_to do |format|
      if @cart_carry.update(cart_carry_params)
        format.html { redirect_to @cart_carry, notice: "Cart carry was successfully updated." }
        format.json { render :show, status: :ok, location: @cart_carry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart_carry.errors, status: :unprocessable_entity }
      end
    end
  end


  
  def checkout
    puts "CHECKED OUT CART CARRIES"

  end
  # DELETE /cart_carries/1 or /cart_carries/1.json
  def destroy
    puts "HEEElooo"
    @cart_carry.destroy
    redirect_to cart_path

    # respond_to do |format|
    #   format.html { redirect_to cart_carries_url, notice: "Cart carry was successfully destroyed." }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_carry
      @cart_carry = CartCarry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_carry_params
      params.fetch(:cart_carry, {})
    end
end
