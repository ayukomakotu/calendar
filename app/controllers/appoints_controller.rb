class AppointsController < ApplicationController
    def index
        # クエリストリングがあればTimeオブジェクトに変換、ない場合は現在の時刻を取得
        @day = params[:day] ? Date.parse(params[:day]) : Time.zone.today
        @users = User.all
        @appoints = Appoint.find_by(day: Date.today)
    end
end
