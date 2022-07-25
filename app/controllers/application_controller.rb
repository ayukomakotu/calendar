class ApplicationController < ActionController::Base

    include SessionsHelper

    #ログイン後の遷移先を指定
    def after_sign_in_path_for(resource)
        home_path
    end
    
    #ログインしていなければログイン画面に移動
    def logged_in_user
        unless user_signed_in?
          flash[:danger] = "ログインしてください"
          redirect_to root_url
        end
    end
end
