module Facades
  class Availabilities

    attr_reader :current_date,
                :availability,
                :week_dates

    def initialize(availabilities, date = Date.today, week_count = 3)
      @current_date   = date
      @availabilities = availabilities
      week_dates_for(date, week_count)
    end

    def weeks
      @week_dates.size
    end

    def is_available?(date)
      selected = nil
      @availabilities.delete_if do |availability|
        selected = availability if date == availability.day
      end

      @availability = AvailableRow.new(selected, date).view_attributes

    end

    def get_date_for(week, day_in_week)
      @week_dates[week][:start_at] + day_in_week
    end

    private

    def week_dates_for(date, week_count)
      @week_dates = []
      week_count.times do |week|
        week_date = date + (week * 7)
        @week_dates << { start_at: week_date.beginning_of_week }
      end
      @week_dates
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
