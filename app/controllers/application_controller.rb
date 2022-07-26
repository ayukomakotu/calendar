class ApplicationController < ActionController::Base

    include SessionsHelper

    #ログイン後の遷移先を指定
    def after_sign_in_path_for(resource)
        home_path
    end

    # ログイン済みユーザーかどうか確認
    def logged_in_user
        unless logged_in?
          store_location
          flash[:danger] = "ログインしてください"
          redirect_to login_url
        end
    end
end
