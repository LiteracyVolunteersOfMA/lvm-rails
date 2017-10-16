class StudentComment < ApplicationRecord
  belongs_to :student

  validates :content, presence: true
  validates :student, presence: true

  def author
    if User.find(commented_by).role == 1
      Coordinator.find(commented_by).name
    elsif User.find(commented_by).role == 2
      return "Administrator"
    end
    end
end
