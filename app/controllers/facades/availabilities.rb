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

  end
end
