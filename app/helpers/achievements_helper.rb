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

    #営業所年間実績
    def annual_achievement_all(year)
        @users.map{ |user| user.annual_achievement(year) }.sum
    end

    # 営業所目標を取得
    def annual_target_all(year)
        Target.find_by(office_id: @office, year: year)
    end

    # 営業所年間実績不足
    def annual_short_all(year)
        annual_achievement_all(year) - annual_target_all(year).all
    end

    # 営業所年間実績達成率
    def annual_rate_all(year)
        ((annual_achievement_all(year).to_f / annual_target_all(year).all.to_f) * 100).floor(2)
    end
end
