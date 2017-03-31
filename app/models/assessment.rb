class Assessment < ApplicationRecord
  belongs_to :student

  validates :score, presence: true, length: { maximum: 6 }
  validates :subject, presence: true
  validates :name, presence: true
  validates :level, presence: true
  validates :type, presence: true
end
