class Book < ApplicationRecord
  belongs_to :user
  has_many :notifications, as: :notifiable, dependent: :destroy

  validates :title, :body, presence: true
  validates :body, length: { maximum: 200 }
end
