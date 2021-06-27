class Public < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,:registerable,
         :recoverable, :rememberable, :validatable

  has_many :post, dependent: :destroy

  def self.search(search)
    return Post.all unless search
    Post.where(['genre LIKE ?', "%#{search}%"])
  end

end
