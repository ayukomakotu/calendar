class AchievementsController < ApplicationController
    before_action :logged_in_user
    def index
        @offices = Office.all
        # パラメータにoffice_idが入っていればそれを参照してofficeを取得、なければログインしているユーザーのofficeを参照
        @office = params[:office] ? Office.find(params[:office]) : current_user.office
        @users = User.where(office_id: @office.id)
        # 今年度を取得 3月から2月
        @year = (Date.current << 2).year
        @month = params[:date] ? params[:date][:month].to_i : Date.today.month 
    end
end
