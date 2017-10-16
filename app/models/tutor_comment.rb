class TutorComment < ApplicationRecord
  belongs_to :tutor

  validates :content, presence: true
  validates :tutor,   presence: true

  def author
    if User.find(commented_by).role == 1
      Coordinator.find(commented_by).name
    elsif User.find(commented_by).role == 2
      return "Administrator"
    end
    end
end
