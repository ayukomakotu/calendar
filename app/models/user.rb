class User < ApplicationRecord
  has_many :events
  has_many :appoints
  has_many :orders
  # has_many :orders,               through: :events,
  #                                  source: :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: true,
                   length: { maximum: 50},
                   uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
  length: { maximum: 255 },
  format: { with: VALID_EMAIL_REGEX },
  uniqueness: true
                   
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
