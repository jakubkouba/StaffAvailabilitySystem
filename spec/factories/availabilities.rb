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
    time_from "17:52:08"
    time_to "17:52:08"

    trait :invalid do
      day "ivalid_day"
      time_from "invalid_time"
      time_to "invalid_time"
    end

  end

end
