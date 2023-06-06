class Course < ApplicationRecord
  has_many :user_courses, foreign_key: "course_id"
  has_many :users, through: :user_courses

  validates :course, presence: true
  validates :enrolled_date, presence: true
  validates :description, length: { maximum: 500 }
  validates :course, uniqueness: true
end
