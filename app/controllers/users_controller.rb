class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params) # Not the final implementation!
    if @user.save
      flash[:success] = "Welcome to the Annotation Tool, you have successfully made an account!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :annotatorID, :password, :password_confirmation)
    end
end