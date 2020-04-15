
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
  # def update
  #   respond_to do |format|
  #     if @client.update(client_params)
  #       format.html { redirect_to clients_path, notice: 'Perfil atualizado com sucesso.' }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @client.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def update
    # @client.saldo_dotz += @client.dotz.moeda
    @client = Client.find(params[:id])
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to clients_path, notice: 'Perfil atualizado com sucesso.' }
        # format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @client.destroy
  end

  private

    def set_client
      @client = Client.find(params[:id])
    end
    
    def client_params
      params.require(:client).permit(:nome, :email, :cpf, :saldo_dotz, dotz_attributes: [:moeda])
    end
end
  