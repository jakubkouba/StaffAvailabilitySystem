# == Schema Information
#
# Table name: staff_types
#
#  id    :integer          not null, primary key
#  title :string(64)
#

class StaffType < ActiveRecord::Base
  has_and_belongs_to_many :employees, join_table: 'positions'
end
