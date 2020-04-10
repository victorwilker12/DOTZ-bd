class ClientController < ApplicationController
  before_action :set_client, only: [:profile]
  
  def profile
  end

  private

  def set_client
    @client = Client.find_by(id: current_client.id)
  end
  
  def client_params
    params.require(:client).permit(:email, :nome, :cpf, :saldo_dotz)
  end
  
end
