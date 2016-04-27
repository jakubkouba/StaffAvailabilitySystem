# == Schema Information
#
# Table name: availabilities
#
#  id          :integer          not null, primary key
#  employee_id :integer
#  day         :date             not null
#  time_from   :datetime         not null
#  time_to     :datetime         not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_availabilities_on_employee_id  (employee_id)
#

FactoryGirl.define do
  factory :availability do
    sequence(:day) { |n| Date.parse('2016-04-25') + n }
    sequence(:time_from) { |n| Time.new(2016, 4, 25, 14, 0, 0) + n.day }
    sequence(:time_to) { |n| Time.new(2016, 4, 25, 22, 0, 0) + n.day }

    trait :invalid do
      day "ivalid_day"
      time_from "invalid_time"
      time_to "invalid_time"
    end

  end

end
