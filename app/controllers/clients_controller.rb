
class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if current_client.update(client_params)
        format.html { redirect_to current_client, notice: 'Perfil atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: current_client }
      else
        format.html { render :edit }
        format.json { render json: current_client.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_client
      @client = Client.find_by(id: current_client.id)
    end
    
    def client_params
      params.require(:client).permit(:email, :nome, :cpf)
    end
end
  