class UsersController < ApplicationController

  # before_action :authorize_user, :except => [:new, :create]

  def show
   @user = User.find(params[:id])
   @entries = @user.entries.paginate(page: params[:page])
  end

  def new
   @user = User.new
  end

  def create
   @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to My Journal"
      redirect_to @user
    else
      render 'new'
    end
  end



  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

  end
