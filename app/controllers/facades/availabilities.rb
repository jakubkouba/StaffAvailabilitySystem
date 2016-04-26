module Facades
  class Availabilities

    def initialize(availabilities, date = Date.today)
      @current_date   = date
      @availabilities = availabilities
    end

    def week_dates(week_count = 3)
      dates = []
      week_count.times do |week|
        week_date = @current_date + (week * 7)
        dates << [ week_date.beginning_of_week, week_date.end_of_week ]
      end
      dates
    end

    def is_available?(date)
      selected = nil
      @availabilities.delete_if do |availability|
        selected = availability if date == availability.day
      end

      {
          disabled:  selected ? false : true,
          date:      date.to_formatted_s(:date),
          time_from: selected ? selected.time_from.to_formatted_s(:time) : '00:00',
          time_to:   selected ? selected.time_to.to_formatted_s(:time) : '00:00'
      }

    end

  end
end
