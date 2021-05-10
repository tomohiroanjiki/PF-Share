class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :post, dependent: :destroy
  attachment :profil_image

  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォロー取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # フォロワー取得

  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人

   #フォローをする
  def follow(customer_id)
    follower.create(followed_id: customer_id)
  end

  #フォローを外す
  def unfollow(customer_id)
    follower.find_by(followed_id: customer_id).destroy
  end

  #フォローをしていればtrueを返す
  def following?(customer)
    following_user.include?(customer)
  end

  def active_for_authentication?
    super && (is_active == true)
  end
end
