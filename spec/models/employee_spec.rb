# == Schema Information
#
# Table name: employees
#
#  id            :integer          not null, primary key
#  name          :string(64)       not null
#  surname       :string(64)       not null
#  date_of_birth :datetime         not null
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

  describe 'email address' do

    let(:employee) {Employee.new}

    it 'should be valid' do
      employee.email = 'john.doe@gmail.com'
      employee.valid?
      expect(employee.errors.messages[:email]).to be(nil)

    end

    it 'should be invalid' do
      employee.email = 'john.doegmail.com'
      employee.valid?
      expect(employee.errors.messages[:email]).not_to be(nil)
    end
  end


end
