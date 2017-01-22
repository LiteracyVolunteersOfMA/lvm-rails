class Coordinator < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :enrollments
  has_many :students, through: :enrollments

  has_many :volunteer_jobs
  has_many :tutors, through: :volunteer_jobs

  before_save { email.downcase! }

  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :name, presence: true, length: { maximum: 50 }
end
