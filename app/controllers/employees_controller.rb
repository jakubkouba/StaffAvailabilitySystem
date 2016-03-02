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

class EmployeesController < ApplicationController
  def new
    @employee    = Employee.new
    @shirt_sizes = INIT_VALS[:shirt_sizes].map { |size| [size, size]}
    @staff_types = StaffType.all
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
