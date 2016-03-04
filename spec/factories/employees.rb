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
    shirt_size 2
    password 'JohnDoe123'

    transient do
      association_list_count 2
    end

    after(:build) { |employee, evaluator| employee.staff_types = create_list(:staff_type, evaluator.association_list_count) }

    trait :invalid do
      name "^&*)scsdvs"
      surname "(*&^$$%43dsd"
      date_of_birth "25/03/1983"
      email "john.doegmail.com"
      shirt_size 'not a shirt size'
      password 'John'

      after(:build) { |employee| employee.staff_types = [] }
    end

    factory :invalid_employee, traits: [:invalid]

    trait :with_access_levels do
      after(:build) {|employee, evaluator| employee.access_levels = create_list(:access_level, evaluator.association_list_count)}
    end

  end
end
