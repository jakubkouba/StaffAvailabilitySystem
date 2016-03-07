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
    password 'JohnDoe123'


    transient do
      association_list_count 2
    end

    trait :passwd_confirm do
      password_confirmation 'JohnDoe123'
    end

    trait :with_staff_type_ids do
      staff_type_ids [1,2,'']
    end

    trait :with_access_levels_ids do
      access_level_ids [2, 3]
    end

    trait :with_staff_types do
      after(:build) { |employee, evaluator| employee.staff_types = create_list(:staff_type, evaluator.association_list_count) }
    end

    trait :with_access_levels do
      after(:build) {|employee, evaluator| employee.access_levels = create_list(:access_level, evaluator.association_list_count)}
    end

    trait :invalid do
      name "^&*)scsdvs"
      surname "(*&^$$%43dsd"
      date_of_birth "25/03/1983"
      email "john.doegmail.com"
      shirt_size 'XL'
      password 'John'

      after(:build) { |employee| employee.staff_types = [] }
    end

    factory :invalid_employee, traits: [:invalid]
    factory :post_request_employee, traits: [:with_staff_type_ids, :with_access_levels_ids, :passwd_confirm ]
    factory :valid_employee, traits: [:with_staff_type_ids, :passwd_confirm]

  end
end
