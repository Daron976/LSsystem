class User < ApplicationRecord
  has_secure_password
  has_many :user_courses, foreign_key: "user_id"
  has_many :courses, through: :user_courses

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, length: { maximum: 25 }
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/ }
  validates :password, length: { minimum: 8 }, if: -> { new_record? || !password.nil? }
end
EMAIL_REGEX = '/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/'
