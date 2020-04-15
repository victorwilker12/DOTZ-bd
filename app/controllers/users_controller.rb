class UsersController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_user, only: [:update]

  def index
    @users = User.all
  end  

  def update
    @user = current_user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Usuário atualizado com sucesso!!' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_dotz
    current_user.update(saldo_dotz: params[:compensador_dotz])
  end  

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:nome, :email, :cpf, :saldo_dotz)
    end
    
  
end
