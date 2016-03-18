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
    day "2016-03-17"
    time_from "2016-03-17 17:52:08"
    time_to "2016-03-17 17:52:08"
  end
end
