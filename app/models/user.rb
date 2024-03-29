class User < ApplicationRecord
  has_many :events
  has_many :appoints
  has_many :orders
  has_many :orders,               through: :events,
                                   source: :orders
  has_many :targets                                   
  belongs_to :office
  validates :name, presence: true,
                   length: { maximum: 50},
                   uniqueness: true
  validates :number, presence: true, uniqueness: true
  has_secure_password
  validates :password, presence: true, 
                        length: { minimum: 6 },
                        allow_nil: true
                   
   # 渡された文字列のハッシュ値を返す
   def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end  

  # ランダムなトークンを返す
  def User.new_token
      SecureRandom.urlsafe_base64
  end

  # 永続セッションのためにユーザーをデータベースに記憶する
  #コンピューター間の処理なのでvaridationに引っ掛かることがない
  #varidationをスキップして処理をはやめる
  #update_attributeはvaridationをスキップして、データベースを更新する
  def remember
      self.remember_token = User.new_token
      update_attribute(:remember_digest, User.digest(remember_token))
  end

  # 渡されたトークンがダイジェストと一致したらtrueを返す
  # attribute: reemeber, activation, reset
  def authenticated?(attribute, token)
      digest = send("#{attribute}_digest")
      return false if digest.nil?
      BCrypt::Password.new(digest).is_password?(token)
  end

  # ユーザーのログイン情報を破棄する
  def forget
      self.update_attribute(:remember_digest, nil)
  end
  
  def daily_appoint(day)
    # 特定のユーザーの一日のアポを表示
    # user.appointsの中からday= :dayの条件を満たすものを探す
    # "#{day}"だとうまくいかないのでシンボルで変数展開
    self.appoints.where("day = :day", day: day)
  end

  # 当日売上　　当日の4時までの売上を抽出したい（未完成　0時から0時まで）
  def today_achievement
    self.orders.where(created_at: Time.zone.parse(Time.zone.today.to_s).all_day).map(&:price).sum
  end
  # 月次実績
  def monthly_achievement(year, month)
    self.orders.where(day: Date.parse("#{year}-#{month}-1").all_month).map(&:price).sum
  end

  #月目標
  def monthly_target(year, month)
    #attributesでカラムとその値をhashで取得
    Target.find_by(user_id: self.id, year: year).attributes["tr_#{month}"]
  end

  #月実績不足分
  def monthly_short(year, month)
    self.monthly_achievement(year, month) - self.monthly_target(year, month)
  end

  #達成率
  def monthly_rate(year, month)
    ((self.monthly_achievement(year, month).to_f / self.monthly_target(year, month).to_f) * 100).floor(2)
  end
  
  #年間実績
  def annual_achievement(year)
    self.orders.where(day: "#{year}-3-1".to_date .. "#{year + 1}-2-1".to_date.end_of_month).map(&:price).sum
  end

  # 年間目標を取得
  def annual_target(year)
    Target.find_by(user_id: self.id, year: year)
  end

  # 年間実績不足
  def annual_short(year)
    self.annual_achievement(year) - self.annual_target(year).all
  end

  #年間達成率
  def annual_rate(year)
    ((self.annual_achievement(year).to_f / self.annual_target(year).all.to_f) * 100).floor(2)
  end
end
