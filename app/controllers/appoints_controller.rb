class AppointsController < ApplicationController
    def index
        # クエリストリングがあればTimeオブジェクトに変換、ない場合は現在の時刻を取得
        @day = params[:day] ? Date.parse(params[:day]) : Time.zone.today
        @users = User.all
    end

    def new
        @appoint = Appoint.new
    end

    def create
        @appoint = Appoint.new(appoint_params)
        if @appoint.save
            flash[:info] = "予定を追加しました"
            redirect_to appoints_path
        else
            render 'new'
        end
    end

    def edit
        @appoint = Appoint.find(params[:id])
    end

    def update
        @appoint = Appoint.find(params[:id])
        if @appoint.update(appoint_params)
            flash[:success] = "調査内容を変更しました"
            redirect_to appoints_path
        else
            render 'edit'
        end
    end

    private
        def appoint_params
            params.require(:appoint).permit(:name, :address, :telephone,
                    :day, :time, :kind, :user_id)
        end
end
