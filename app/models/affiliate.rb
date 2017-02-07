class Affiliate < ApplicationRecord

    has_many :coordinators
    has_many: tutors

    has_many :matches
    has_many :students, through: :matches
end
