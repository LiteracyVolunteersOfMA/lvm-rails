require 'rails_helper'

RSpec.describe Student, type: :model do
  describe 'associations' do
    it 'should have many matches' do
      should have_many(:matches)
    end

    it 'tutors through matches' do
      should have_many(:tutors).through(:matches)
    end

    it 'should have many enrollments' do
      should have_many(:enrollments)
    end

    it 'coordinators through enrollments' do
      should have_many(:coordinators).through(:enrollments)
    end
  end

  describe 'validations' do
    describe 'first_name' do
      it 'validates presence' do
        should validate_presence_of(:first_name)
      end
      it 'validates length' do
        should validate_length_of(:last_name)
          .is_at_most(50)
      end
    end

    describe 'last_name' do
      it 'validates presence' do
        should validate_presence_of(:last_name)
      end
      it 'validates length' do
        should validate_length_of(:last_name)
          .is_at_most(50)
      end
    end
    # todo: add these
    # add_column :students, :first_name,      :string
    # add_column :students, :last_name,       :string
    # add_column :students, :dob,             :date
    # add_column :students, :gender,          :string
    # add_column :students, :address,         :string
    # add_column :students, :city,            :string
    # add_column :students, :state,           :string
    # add_column :students, :zip,             :string
    # add_column :students, :mail_ok          :boolean
    # add_column :students, :email,           :string
    # add_column :students, :email_ok         :boolean
    # add_column :students, :cell_phone,      :string
    # add_column :students, :cell_ok          :boolean
    # add_column :students, :cell_lvm_ok      :boolean
    # add_column :students, :home_phone,      :string
    # add_column :students, :home_ok,         :boolean
    # add_column :students, :home_lvm_ok,     :boolean
    # add_column :students, :work_number,     :string
    # add_column :students, :work_ok,         :boolean
    # add_column :students, :lvm_ok,          :boolean
    # add_column :students, :alternate_number :string
    # # emergency contact
    # add_column :students, :emergency_name   :string
    # add_column :students, :emergency_number :string
    # # referral
    # add_column :students, :referral         :string
    # add_column :students, :why_lvm          :string
    # # demographic
    # add_column :students, :race             :string
    # add_column :students, :is_hispanic      :boolean
    # add_column :students, :native_language  :string
    # add_column :students, :origin_country   :string

  end
end
