
class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
    @clients = Client.all
  end

  def show
  end

  def edit
    @client = Client.find(params[:id])  
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @client = Client.find(params[:id])
    valor_atual = @client.saldo_dotz
    
    respond_to do |format|
     # puts  @client.saldo_dotz = @client.saldo_dotz + a
      if @client.update(client_params)
        resultado= valor_atual + @client.saldo_dotz
        @client.update saldo_dotz: resultado
        format.html { redirect_to clients_path,flash: {  success:  "Perfil atualizado com sucesso" }}
        # format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_path, flash: {  success:  "Cliente removido com sucesso" } 
  end

  private

    def set_client
      @client = Client.find(params[:id])
    end
    
    def client_params
      params.require(:client).permit(:nome, :email, :cpf, :saldo_dotz)
    end
end
  