class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def show
  end

  def me
    @user = current_user
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to me_users_url, notice: 'Usuario fue creado exitosamente.'
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to me_users_url, notice: 'Usuario fue actualizado exitosamente.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'Usuario fue eliminado exitosamente.'
  end

  private

  def user_params
    params.require(:user)
          .permit(:id, :first_name, :last_name, :phone, :birthday, :gender, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
