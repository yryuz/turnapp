class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 with_options presence: true do
  validates :nickname
  validates :password_confirmation
  validates :year
  validates :introduction
 end

 validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }

 has_many :tunes, dependent: :destroy
 has_many :comments
 has_many :relationships, dependent: :destroy
 has_many :followings, through: :relationships, source: :follower
 has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy 
  has_many :followers, through: :passive_relationships, source: :user 

  def follow(other_user)
    return if self == other_user

    relationships.find_or_create_by!(follower: other_user)
  end

  def following?(user)
    followings.include?(user)
  end

  def unfollow(relathinoship_id)
    relationships.find(relathinoship_id).destroy!
  end
  
end
