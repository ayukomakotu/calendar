class User < ApplicationRecord
  has_many :events
  has_many :appoints
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
end
