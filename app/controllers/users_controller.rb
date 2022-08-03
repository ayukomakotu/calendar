class UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  private
      def user_params
        params.require(:user).permit(:name, :number, :password, :password_confirmation,)
      end
end
