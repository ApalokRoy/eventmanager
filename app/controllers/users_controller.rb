class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tasks = Task.where(["user_id = ?", params[:id]])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "#{@user.name}, Welcome to the Event Management System!"
      redirect_to user_path(@user) 

    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def index
    @users = User.paginate(page: params[:page], per_page:10)
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_path
  end
 
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
