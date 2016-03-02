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

FactoryGirl.define do
  factory :employee do
    name "John"
    surname "Doe"
    date_of_birth "25/03/1983"
    email "john.doe@gmail.com"
    shirt_size 'XL'
    password_salt BCrypt::Engine.generate_salt
    password_hash BCrypt::Engine.hash_secret('password', '$2a$10$6rjysH18.eqiui2EFZd3Ee')
    last_login "2016-02-24 14:29:24"
    password 'JohnDoe123'
  end
end
