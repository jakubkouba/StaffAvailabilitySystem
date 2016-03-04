# == Schema Information
#
# Table name: access_levels
#
#  id    :integer          not null, primary key
#  title :string(255)
#

FactoryGirl.define do
  factory :access_level do
    sequence(:title) {|n| "access_level_#{n}"}
  end
end
