class AffiliateEvent < ApplicationRecord
  belongs_to :tutor

  validates :title, presence: true
  validates :date,  presence: true
  validates :tutor, presence: true
end
