class AvailabilitiesController < ApplicationController

  ensure_employee_presence_and_auth only: [:create, :show, :update]

  def create
  end

  def show
    @current_date = Date.today
    @availabilities = @employee.availabilities
  end

  def update

    if @employee.availabilities.create(availabilities_collection)
      redirect_to availabilities_path, notice: 'Availability times has been updated'
    else
      redirect_to availabilities_path, notice: 'Unable to save availability times'
    end
  end

  def availabilities_collection
    collection = []
    params['available-times'].each do |date, times|
      collection << { day:       date,
                      time_from: create_time_obj(times['from']),
                      time_to:   create_time_obj(times['to']) }
    end
    collection
  end

  def create_time_obj(time)
    time = time.split(':')
    if time.size == 2
      time.each { |time_fragment| return nil unless time_fragment.match(/\d{2}/) }
      hour, minute = time[0], time[1]
      hour > '12' || minute > '60' ? nil : Time.new(0, 1, 1, hour, minute)
    end
  end

end
