require 'rails_helper'

RSpec.describe AffiliateEvent, type: :model do
  describe 'associations' do
    it 'should belong to a tutor' do
      should belong_to(:tutor)
    end
  end

  describe 'validations' do
    describe 'title' do
      it 'validates presence' do
        should validate_presence_of(:title)
      end
    end

    describe 'date' do
      it 'validates presence' do
        should validate_presence_of(:date)
      end
    end

    describe 'tutor' do
      it 'validates presence' do
        should validate_presence_of(:tutor)
      end
    end
  end
end
