module AchievementsHelper

    #営業所全体売上
    def today_all
        @users.map{ |user| user.today_achievement }.sum
    end
    
    # 営業所月累計
    def monthly_all
        @users.map{ |user| user.monthly_achievement(Date.today) }.sum
    end

    # 営業所月目標
    def monthly_target_all
        Target.find_by(office_id: @office.id, year: 2022).attributes["tr_#{Date.today.month}"] 
    end

    #　営業所月不足
    def monthly_short_all
        @users.map{ |user| user.monthly_achievement(Date.today) }.sum -
                Target.find_by(office_id: @office.id, year: 2022).attributes["tr_#{Date.today.month}"]
    end

    # 営業所月達成率
    def monthly_rate_all
        ((@users.map{ |user| user.monthly_achievement(Date.today) }.sum.to_f /
            Target.find_by(office_id: @office.id, year: 2022).attributes["tr_#{Date.today.month}"])* 100).floor(2)
    end

end
