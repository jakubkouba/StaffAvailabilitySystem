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

  before_action :prepare_view, only: [:new, :create, :edit]

  before_action :current_employee, except: [:new, :create]

  def new
    @employee    = Employee.new
  end

  def create
    @employee = Employee.new(permitted_params)
    assign_assoc_attributes
    respond_to do |format|
      if @employee.save
        format.html { redirect_to login_path, notice: 'Your account was successfully created' }
      else
        format.html { render :new }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def dashboard

  end

  def shirt_sizes
    @shirt_sizes = INIT_VALS[:shirt_sizes]
  end

  def staff_types
    @staff_types = StaffType.all
  end

  def access_levels
    @access_levels = nil
  end

  def prepare_view
    shirt_sizes
    staff_types
    access_levels
  end

  private

  def permitted_params
    permitted = [
        :name,
        :surname,
        :email,
        :date_of_birth,
        :shirt_size,
        :password,
        :password_confirmation,
        :dob
    ]
    params.require(:employee).permit(*permitted)
  end

  def assoc_attributes
    [
        :staff_type_ids,
        :access_level_ids
    ]
  end

  def assign_assoc_attributes
    assoc_attributes.each { |attr| @employee.send("#{attr}=", params.require(:employee).fetch(attr, nil)) }
  end
end
