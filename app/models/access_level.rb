# == Schema Information
#
# Table name: access_levels
#
#  id    :integer          not null, primary key
#  title :string(255)
#

class AccessLevel < ActiveRecord::Base
  has_and_belongs_to_many :employees, join_table: 'authorizations'
end
