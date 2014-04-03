class Admin::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @users = User.find(params[:id])
  end

  def new
    @users = User.new
  end

  def edit
    @users = User.find(params[:id])
  end

  def create
    @users = User.new(user_params)

    if @users.save
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def update
    @users = User.find(params[:id])

    if @users.update_attributes(user_params)
      redirect_to admin_users_path(@users)
    else
      redirect :edit
    end
  end

  def destroy
    @users = User.find(params[:id])
    @users.destroy
    redirect_to admin_users_path    
  end

  protected

  def user_params
    params.require(:user).permit(
      :email, :firstname, :lastname, :admin
    )
  end

end
