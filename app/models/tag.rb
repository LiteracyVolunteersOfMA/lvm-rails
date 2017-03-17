class Tag < ApplicationRecord
  has_many :taggings
  has_many :students, through: :taggings
  has_many :tutors, through: :taggings

  def count
    Tagging.where(tag_id: id).count
  end
end
