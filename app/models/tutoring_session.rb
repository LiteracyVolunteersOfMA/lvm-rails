class TutoringSession < ApplicationRecord
  belongs_to :student
  belongs_to :tutor

  validates :location, presence: true
  validates :hours, presence: true,
                    length: { maximum: 4 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  # validates :student,      presence: true
  # validates :tutor,        presence: true
end
