require 'rails_helper'

RSpec.describe Exam, type: :model do
  describe 'associations' do
    it 'should belong to a student' do
      should belong_to(:student)
    end

    it 'should belong to a tutor' do
      should belong_to(:tutor)
    end
  end
end
