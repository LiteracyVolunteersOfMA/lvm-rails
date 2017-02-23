require 'rails_helper'

RSpec.describe Tutor, type: :model do
  describe 'associations' do
    it 'should have many matches' do
      should have_many(:matches)
    end

    it 'students through matches' do
      should have_many(:students).through(:matches)
    end

    it 'should have many volunteer_jobs' do
      should have_many(:volunteer_jobs)
    end

    it 'coordinators through volunteer_jobs' do
      should have_many(:coordinators).through(:volunteer_jobs)
    end
  end

  describe 'validations' do
    describe 'address1' do
      it 'validates presence' do
        should validate_presence_of(:address1)
      end
    end

    describe 'address2' do
      it 'validates presence' do
        should validate_presence_of(:address2)
      end
    end

    describe 'cell_phone' do
      it 'validates presence' do
        should validate_presence_of(:cell_phone)
      end

      it 'validates format' do
        should allow_value('(555) 555-5555').for(:cell_phone)
        should allow_value('555-555-5555').for(:cell_phone)
        should_not allow_value('43-4343-4444').for(:cell_phone)
        should_not allow_value('434-3433-4444').for(:cell_phone)
        should_not allow_value('434-434-444').for(:cell_phone)
        should_not allow_value('4333-433-4444').for(:cell_phone)
        should_not allow_value('(232) 343-99439').for(:cell_phone)
        should_not allow_value('(abc) 123-defg').for(:cell_phone)
      end
    end

    describe 'city' do
      it 'validates presence' do
        should validate_presence_of(:city)
      end
    end

    describe 'country_of_birth' do
      it 'validates presence' do
        should validate_presence_of(:country_of_birth)
      end
    end

    describe 'date_of_birth' do
      it 'validates presence' do
        should validate_presence_of(:date_of_birth)
      end
    end

    describe 'email_other' do
      subject { FactoryGirl.build(:tutor) }

      it 'validates length' do
        should validate_length_of(:email_other)
          .is_at_most(255)
      end

      it 'validates format' do
        should allow_value('email@address.foo').for(:email_other)
        should_not allow_value('foo').for(:email_other)
        should_not allow_value('foo@').for(:email_other)
        should_not allow_value('foo@address').for(:email_other)
        should_not allow_value('address.foo').for(:email_other)
      end

      it 'validates uniqueness' do
        should validate_uniqueness_of(:email_other).case_insensitive
      end
    end

    describe 'email_preferred' do
      subject { FactoryGirl.build(:tutor) }

      it 'validates presence' do
        should validate_presence_of(:email_preferred)
      end

      it 'validates length' do
        should validate_length_of(:email_preferred)
          .is_at_most(255)
      end

      it 'validates format' do
        should allow_value('email@address.foo').for(:email_preferred)
        should_not allow_value('foo').for(:email_preferred)
        should_not allow_value('foo@').for(:email_preferred)
        should_not allow_value('foo@address').for(:email_preferred)
        should_not allow_value('address.foo').for(:email_preferred)
      end

      it 'validates uniqueness' do
        should validate_uniqueness_of(:email_preferred).case_insensitive
      end
    end

    describe 'emergency_contact_email' do
      it 'validates presence' do
        should validate_presence_of(:emergency_contact_email)
      end
    end

    describe 'emergency_contact_name' do
      it 'validates presence' do
        should validate_presence_of(:emergency_contact_name)
      end
    end

    describe 'emergency_contact_phone' do
      it 'validates presence' do
        should validate_presence_of(:emergency_contact_name)
      end
    end

    describe 'first_name' do
      it 'validates presence' do
        should validate_presence_of(:first_name)
      end
    end

    describe 'hispanic_or_latino' do
      it 'validates presence' do
        should_not allow_value(nil).for(:hispanic_or_latino)
      end
    end

    describe 'home_phone' do
      it 'validates presence' do
        should validate_presence_of(:home_phone)
      end

      it 'validates format' do
        should allow_value('(555) 555-5555').for(:home_phone)
        should allow_value('555-555-5555').for(:home_phone)
        should_not allow_value('43-4343-4444').for(:home_phone)
        should_not allow_value('434-3433-4444').for(:home_phone)
        should_not allow_value('434-434-444').for(:home_phone)
        should_not allow_value('4333-433-4444').for(:home_phone)
        should_not allow_value('(232) 343-99439').for(:home_phone)
        should_not allow_value('(abc) 123-defg').for(:home_phone)
      end
    end

    describe 'language_proficiencies' do
      it 'validates presence' do
        should validate_presence_of(:language_proficiencies)
      end
    end

    describe 'last_name' do
      it 'validates presence' do
        should validate_presence_of(:last_name)
      end
    end

    describe 'native_language' do
      it 'validates presence' do
        should validate_presence_of(:native_language)
      end
    end

    describe 'occupation' do
      it 'validates presence' do
        should validate_presence_of(:occupation)
      end
    end

    describe 'other_phone' do
      it 'validates format' do
        should allow_value('(555) 555-5555').for(:other_phone)
        should allow_value('555-555-5555').for(:other_phone)
        should_not allow_value('43-4343-4444').for(:other_phone)
        should_not allow_value('434-3433-4444').for(:other_phone)
        should_not allow_value('434-434-444').for(:other_phone)
        should_not allow_value('4333-433-4444').for(:other_phone)
        should_not allow_value('(232) 343-99439').for(:other_phone)
        should_not allow_value('(abc) 123-defg').for(:other_phone)
      end
    end

    describe 'race' do
      it 'validates presence' do
        should validate_presence_of(:race)
      end
    end

    describe 'smartt_id' do
      it 'validates presence' do
        should validate_presence_of(:smartt_id)
      end
    end

    describe 'state' do
      it 'validates presence' do
        should validate_presence_of(:state)
      end
    end

    describe 'zip' do
      it 'validates presence' do
        should validate_presence_of(:zip)
      end

      it 'validates format' do
        should allow_value('03923').for(:zip)
        should allow_value('54321').for(:zip)
        should_not allow_value('1234').for(:zip)
        should_not allow_value('123456').for(:zip)
        should_not allow_value('abcde').for(:zip)
      end
    end
  end

  describe 'methods' do
    describe '#name' do
      it 'concatenates first_name and last_name' do
        student = create(:student, first_name: 'Test', last_name: 'Testerson')
        full_name = 'Test Testerson'
        expect(student.name).to eq(full_name)
      end
    end
  end
end
