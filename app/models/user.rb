class User < ApplicationRecord
  has_many :user_courses, foreign_key: "user_id"
  has_many :courses, through: :user_courses

  validates :username, presence: true
  validates :username, length: { maximum: 25 }
  validates :username, uniqueness: true
end
