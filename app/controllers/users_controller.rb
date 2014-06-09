class UsersController < ApplicationController
  def show
  end

  def new
    @user = User.new
    @session = User.new
  end

  def create
    @user = User.new(new_user_params)
    if @user.save
      flash[:notice] = "Your account has been created! Login to view your profile."
      redirect_to new_user_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  #define strong parameters
  private
    def new_user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
