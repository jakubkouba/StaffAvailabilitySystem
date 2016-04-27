class AvailabilitiesController < ApplicationController

  ensure_employee_presence_and_auth only: [:create, :show, :update]

  def create
  end

  def show
    @availabilities = Facades::Availabilities.new @employee.availabilities.to_a
  end

  def update
    if Availability.update(params['available-times'], @employee.id)
      redirect_to availabilities_path, notice: 'Availability times has been updated'
    else
      redirect_to availabilities_path, notice: 'Unable to save availability times'
    end
  end

end
