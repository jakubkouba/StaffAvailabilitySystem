# == Schema Information
#
# Table name: employees
#
#  id            :integer          not null, primary key
#  name          :string(64)       not null
#  surname       :string(64)       not null
#  date_of_birth :date             not null
#  email         :string(64)       not null
#  shirt_size    :integer          default(0)
#  password_hash :string(128)      not null
#  password_salt :string(128)      not null
#  last_login    :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe Employee, type: :model do

  it { is_expected.to have_and_belong_to_many(:staff_types) }

  it { is_expected.to have_and_belong_to_many(:access_levels) }


  let(:employee) {build(:employee)}

  it 'is valid' do
    employee.valid?
    expect(employee.errors.messages.keys.empty?).to be_truthy
  end

  context 'attribute presence' do
    [
        :name,
        :surname,
        :date_of_birth,
        :email,
        :password,
        :staff_types
    ].each do |attr|
      it { is_expected.to validate_presence_of(attr) }
    end
  end

  it 'invalidates name and surname are' do
    employee.name = '$John12'
    employee.surname = '&Doe34'

    employee.valid?
    expect(employee.errors.messages[:name]).not_to be_nil
    expect(employee.errors.messages[:surname]).not_to be_nil

  end

  describe 'email address' do
    it 'should be valid' do
      employee.valid?
      expect(employee.errors.messages[:email]).to be(nil)
    end

    it 'should be invalid' do
      employee.email = 'john.doegmail.com'
      employee.valid?
      expect(employee.errors.messages[:email]).not_to be(nil)
    end
  end

  context 'password' do
    it 'is valid' do
      employee.valid?
      expect(employee.errors.messages[:password]).to be_nil
    end

    it 'is invalid' do
      password = Proc.new { |length| rand(36**length).to_s(36) }
      {
          less_than_6_chars:    password.call(5),
          greater_than_2_chars: password.call(22),
          invalid_chars:        '_$%^&'

      }.each do |state, example|
        employee.password = example
        employee.valid?
        expect(employee.errors.messages[:password]).not_to be_nil, "failed with \"#{example}\" because it is not #{state.to_s.gsub('_', ' ')}"
      end
    end

    it 'is confirmed' do
      employee.password_confirmation = 'something_different'
      employee.valid?
      expect(employee.errors.messages[:password_confirmation]).not_to be_nil
    end

  end

  #TODO: How to DRY it up? (Macro or shared example)
  context 'Positions' do
    it 'throws an error if it tries to assign invalid value to staff_types_ids' do
      expect { employee.staff_type_ids = 'not_array' }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  context 'Authorizations' do
    it 'throws an error if it tries to assign invalid value to access_level_ids' do
      expect { employee.access_level_ids = 'not_array' }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  # describe 'validates date of birth format' do
  #   it 'should be invalid' do
  #     employee.date_of_birth = 'incorrect format'
  #     employee.valid?
  #     puts employee.errors.messages[:date_of_birth]
  #     expect(employee.errors.messages[:date_of_birth]).not_to be_nil
  #   end
  # end

  describe 'before #save' do

    @employee = FactoryGirl.build(:employee)
    is_expected_call_before_save(@employee, :create_password_hash, :set_default_access_level, :normalize_name)

  end

  describe '#save' do

    let(:employee) { build(:employee) }

    it 'creates Employee record' do
      expect { employee.save }.to change(Employee, :count).by(1)
    end

    context 'Staff types' do
      it 'save staff type' do
        employee.save
        employee.staff_types do |staff_type|
          expect(staff_type).not_to be_new_record
        end
      end
    end

    context 'Authorizations' do

      let(:employee) {build(:employee, :with_access_levels)}

      it 'assigns default access level' do
        employee.access_levels = []
        employee.save
        expect(employee.access_levels.size).to equal 1
        expect(employee.access_levels.pluck(:title).first).to eq 'staff'
      end

      # Might be duplicit to previous example
      it 'sets default access level to "staff"' do
        employee.access_levels = []
        expect { employee.set_default_access_level }.to change(employee.access_levels, :size).from(0).to(1)
      end

      it 'save access levels' do
        employee.save
        employee.access_levels do |access_level|
          expect(access_level).not_to be_new_record
        end
      end

    end

  end

  it 'creates password_salt and password_hash' do
    employee.password_salt = nil
    employee.password_hash = nil

    employee.create_password_hash
    expect(employee.password_salt).not_to be_nil
    expect(employee.password_hash).not_to be_nil
  end

  it 'normalize named and surname' do
    employee.name    = 'jOhn'
    employee.surname = 'dOE'

    employee.normalize_name
    expect(employee.name).to eq 'John'
    expect(employee.surname).to eq 'Doe'
  end

end
