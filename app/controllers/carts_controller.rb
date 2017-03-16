class CartsController < ApplicationController
  # after_action :authenticate_user!, only: [:create, :new]
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
    # GET /carts
    # GET /carts.json
    def index
      @carts = Cart.all
    end

    # GET /carts/1
    # GET /carts/1.json
    def show
    end

    # GET /carts/new
    def new
      @cart = Cart.new
    end

    # GET /carts/1/edit
    def edit
    end

    # POST /carts
    # POST /carts.json
    def create
      @cart = Cart.new

      respond_to do |format|
        if @cart.save
          format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
          format.json { render :show, status: :created, location: @cart }
        else
          format.html { render :new }
          format.json { render json: @cart.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /carts/1
    # PATCH/PUT /carts/1.json
    def update
      @cart.transaction(params[:stripeToken],params[:stripeEmail])
      @cart.line_items.destroy_all

      respond_to do |format|
        if @cart.update(cart_params)
          format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
          format.json { render :show, status: :ok, location: @cart }
        else
          format.html { render :edit }
          format.json { render json: @cart.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /carts/1
    # DELETE /carts/1.json
    def destroy
      @cart.line_items.destroy_all
      @product.increment!(:inventory,params[:line_item][:quantity].to_i)
      flash[:notice] = "You have cleared your cart"
      redirect_to @cart
    end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_cart
    @cart = Cart.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cart_params
    params.require(:cart).permit(:user_id)
  end
end
