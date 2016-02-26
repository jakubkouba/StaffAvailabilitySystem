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

  let(:employee) {build(:employee)}

  it 'should be valid' do
    employee.valid?
    expect(employee.errors.messages.keys.empty?).to be_truthy
  end

  it 'should validate attributes presence' do
    [
        :name,
        :surname,
        :date_of_birth,
        :email,
        :password_hash,
        :password_salt

    ].each do |attr|
      is_expected.to validate_presence_of(attr)
    end
  end

  it { is_expected.to validate_numericality_of :shirt_size }

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

  describe 'validates password' do
    it 'should be valid' do
      employee.valid?
      expect(employee.errors.messages[:password]).to be_nil
    end

    it 'should be invalid' do
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

    it 'should not be empty' do
      employee.password = nil
      employee.valid?
      expect(employee.errors.messages[:password]).not_to be nil
    end

  end

end
