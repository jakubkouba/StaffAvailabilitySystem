# == Schema Information
#
# Table name: staff_types
#
#  id    :integer          not null, primary key
#  title :string(64)
#

FactoryGirl.define do
  factory :staff_type do
    title "MyString"
  end
end
