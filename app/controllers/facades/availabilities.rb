module Facades
  class Availabilities

    attr_reader :current_date,
                :availability,
                :week_dates,
                :week_count

    def initialize(availabilities, date = Date.today, week_count = 3)
      @current_date   = date
      @availabilities = availabilities
      @week_count = week_count
      week_dates_for(date, week_count)
    end

    def is_available?(date)
      selected = nil
      @availabilities.delete_if do |availability|
        selected = availability if date == availability.day
      end

      @availability = AvailableRow.new(selected, date)
      @availability.view_attributes

    end

    def get_date_for(week, day_in_week)
      @week_dates[week][:start_at] + day_in_week
    end

    def orbit_slider_config
      {
          orbit: '',
          swipe: "true",
          bullets: "false",
          "timer-delay" => "false",
          "auto-play" => "false",
          "infinite-wrap" => "false",
          "anim-in-from-right" => "slide-in-right",
          "anim-out-to-right" => "slide-out-right",
          "data-anim-in-from-left" =>	"slide-in-left",
          "data-anim-out-to-left" => "slide-out-left"
      }
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

      def disabled?
        @view_attributes[:disabled]
      end

      def date
        @view_attributes[:date]
      end

      def time(prefix)
        {
            prefix:   prefix,
            disabled: @view_attributes[:disabled],
            date:     @view_attributes[:date],
            time:     @view_attributes["time_#{prefix}".to_sym]
        }
      end

    end

  end
end
