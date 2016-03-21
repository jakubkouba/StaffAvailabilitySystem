class AvailabilitiesController < ApplicationController

  ensure_employee_presence_and_auth only: [:create, :show, :update]

  def create
  end

  def show
    @current_date = Date.today
  end

  def update
  end
end
