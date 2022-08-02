class User < ApplicationRecord
  has_many :events
  has_many :appoints
  has_many :orders
  has_many :orders,               through: :events,
                                   source: :orders
  validates :name, presence: true,
                   length: { maximum: 50},
                   uniqueness: true
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

  # 当日売上　　当日の4時までの売上を抽出したい（未完成）
  def today_achievement
    self.orders.where(created_at: Time.zone.parse(Time.zone.today.to_s).all_day).map(&:price).sum
  end
  # 月次実績
  def monthly_achievement(date)
    self.orders.where(day: Date.parse(date.to_s).all_month).map(&:price).sum
  end
end

