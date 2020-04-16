class PurchasesController < ApplicationController
  before_action :authenticate_client!, only: [:create, :new]
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]
  before_action :set_product, only: [:new, :create]

  # GET /purchases
  # GET /purchases.json
  def index
    @purchases = Purchase.all
  end

  def purchases_of_client
    @purchases = Purchase.where(client_id: current_client)
  end

  # GET /purchases/1
  # GET /purchases/1.json
  def show
  end

  # GET /purchases/new
  def new
    @purchase = Purchase.new
  end

  # GET /purchases/1/edit
  def edit
  end

  # POST /purchases
  # POST /purchases.json
  def create
    @client = current_client
    @purchase = Purchase.new(purchase_params)
    valor_total_da_compra = @purchase.quantidade*@product.valor_dotz
    quantidade_de_produtos = @purchase.quantidade
    produtos_no_estoque = @product.estoque

    if (@client.saldo_dotz >= valor_total_da_compra) && (quantidade_de_produtos <= produtos_no_estoque)
      @purchase.client_id = @client.id
      @purchase.product_id = @product.id
      @purchase.valor_da_compra = valor_total_da_compra
      @product.update(estoque: @product.estoque - @purchase.quantidade)
      @client.update(saldo_dotz:  @client.saldo_dotz - valor_total_da_compra)
      
      respond_to do |format|
        if @purchase.save
          format.html { redirect_to products_path, notice: 'Compra realizada com sucesso!!' }
          format.json { render :show, status: :created, location: @purchase }
        else
          format.html { render :new }
          format.json { render json: @purchase.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to products_path, notice: "Saldo Insuficiente para compra"
    end
  end

  # PATCH/PUT /purchases/1
  # PATCH/PUT /purchases/1.json
  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to @purchase, notice: 'Purchase was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase }
      else
        format.html { render :edit }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1
  # DELETE /purchases/1.json
  def destroy
    @purchase.destroy
    respond_to do |format|
      format.html { redirect_to purchases_url, notice: 'Purchase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    def set_product
      @product = Product.find(params[:product_id])
    end
    
    # Only allow a list of trusted parameters through.
    def purchase_params
      params.require(:purchase).permit(:quantidade)
    end
end
