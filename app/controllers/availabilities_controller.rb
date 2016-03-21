class AvailabilitiesController < ApplicationController

  ensure_employee_presence_and_auth only: [:create, :show, :update]

  def create
  end

  def show
  end

  def update
  end
end
