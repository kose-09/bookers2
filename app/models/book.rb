class Book < ApplicationRecord
  belongs_to :user
  has_many :notifications, as: :notifiable, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title, :body, presence: true
  validates :body, length: { maximum: 200 }
  
  def favorited_by?(user)
    favorites.exist?(user_id: user.id)
  end 
  
end
