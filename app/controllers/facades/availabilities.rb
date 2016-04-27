module Facades
  class Availabilities

    attr_reader :current_date,
                :availability

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

      @availability = AvailableRow.new(selected, date).view_attributes

    end

    class AvailableRow

      attr_accessor :view_attributes

      def initialize(availability, date)
        @view_attributes = {
            disabled:  availability ? false : true,
            date:      date.to_formatted_s(:date),
            time_from: availability ? availability.time_from.to_formatted_s(:time) : '00:00',
            time_to:   availability ? availability.time_to.to_formatted_s(:time) : '00:00'
        }
      end

      def time(prefix)
        {
            prefix:   prefix,
            disabled: @availability[:disabled],
            date:     @availability[:date],
            time:     @availability["time_#{prefix}".to_sym]
        }
      end

    end

  end
end
