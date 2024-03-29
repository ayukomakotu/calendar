class SessionsController < ApplicationController
  def new
    redirect_to home_path unless !(logged_in?)
  end

  def create
    user = User.find_by(number: params[:session][:number].to_i)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      flash[:success] = "ログインに成功しました"
      redirect_back_or home_path
    else
      flash.now[:danger] = '番号またはパスワードが間違っています'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_path, status: :see_other
    flash[:info] = "ログアウトしました"
  end
end
