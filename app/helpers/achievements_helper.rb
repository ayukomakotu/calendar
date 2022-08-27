module AchievementsHelper

    #営業所全体売上
    def today_office
        @users.map{ |user| user.today_achievement }.sum
    end
    
    # 営業所月累計
    def monthly_office
        @users.map{ |user| user.monthly_achievement(@year, @month) }.sum
    end

    # 営業所月目標
    def monthly_target_office
        Target.find_by(office_id: @office.id, year: 2022).attributes["tr_#{@month}"] 
    end

    #　営業所月不足
    def monthly_short_office
        monthly_office - monthly_target_office
    end

    # 営業所月達成率
    def monthly_rate_office
        ((monthly_office.to_f / monthly_target_office.to_f) * 100).floor(2)
    end

    #営業所年間実績
    def annual_achievement_office(year)
        @users.map{ |user| user.annual_achievement(year) }.sum
    end

    # 営業所目標を取得
    def annual_target_office(year)
        Target.find_by(office_id: @office, year: year)
    end

    # 営業所年間実績不足
    def annual_short_office(year)
        annual_achievement_office(year) - annual_target_office(year).all
    end

    # 営業所年間実績達成率
    def annual_rate_office(year)
        ((annual_achievement_office(year).to_f / annual_target_office(year).all.to_f) * 100).floor(2)
    end
end
