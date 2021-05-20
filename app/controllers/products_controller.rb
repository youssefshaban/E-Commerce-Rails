class ProductsController < ApplicationController
  before_action :authenticate_seller!, except: %i[index show]
  before_action :set_product, only: %i[show edit update destroy]

  # GET /products or /products.json
  def index

    
    if params[:category]
      @products = Product.cat(params[:category]).order(:created_at).page(params[:page])
    elsif params[:brand]
      @products = Product.brand(params[:brand]).order(:created_at).page(params[:page])
    elsif params[:store]
      @products = Product.seller(params[:store]).order(:created_at).page(params[:page])
    elsif params[:minprice] || params[:maxprice]
      @products = Product.price(params[:minprice],params[:maxprice]).order(:currentPrice).page(params[:page])
      #@products = Product.where(currentPrice:  0..2000)
      puts 'hy'
      #Product.price(params[:price])
    else
      @products = Product.search(params[:search]).order(:created_at).page(params[:page])
    end
    
    # @products = Product.where("category_id = 3")

    # puts params[:name]
    
    
    #@products = Product.all

    # @admin = current_seller
  end

  # GET /products/1 or /products/1.json
  def show
    @product_attachments = @product.ProductAttachment.all
  end

  # GET /products/new
  # before_action :authenticate_seller!, :check_for_store_id , only: :new
  def new
    @product = Product.new
    @product_attachments = @product.ProductAttachment.build
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json

  def create
      puts "YOOO"
      @product = Product.new(product_params)  
      @product.store_id = current_seller.store_id
      respond_to do |format|
        if @product.save
          unless defined? params[:product_attachments]['photos']
            @product_attachments = @product.ProductAttachment.create!(:photo => "",     :product_id => @product.id)
          else

            params[:product_attachments]['photos'].each do |a|
                  @product_attachments = @product.ProductAttachment.create!(:photo => a,     :product_id => @product.id)
            end
          end
          format.html { redirect_to @product, notice: "Product was successfully created." }
          format.json { render :show, status: :created, location: @product }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end

   
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def myproducts
    @myProducts = Product.where("store_id=#{current_seller.store_id}")
  end

  private 
  def check_for_store_id
        puts "HEL:LLLLLOOO"
        puts current_seller.store_id.nil?
        if @current_seller.store_id.nil?
          redirect_to products_url , notice: "You Dont own a store"
          return
        end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :quantity, :currentPrice,  :brand_id ,:category_id , :description , product_attachments_attributes: 
      %i[id product_id photos])
    end
end
