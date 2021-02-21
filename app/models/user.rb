class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   has_many :varieties, dependent: :destroy
   has_many :likes, dependent: :destroy
   has_many :liked_varieties, through: :likes, source: :variety
   has_many :comments, dependent: :destroy

   validates :name, presence: true #追記
   validates :profile, length: { maximum: 200 } #追記

   def already_liked?(variety)
    self.likes.exists?(variety_id: variety.id)
   end

  end
