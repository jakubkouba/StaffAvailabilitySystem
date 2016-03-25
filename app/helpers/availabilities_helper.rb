module AvailabilitiesHelper

  # Returns true if date is in availabilities array
  def availability_set?(date, availabilities)
    selected = nil
    availabilities.delete_if do |availability|
      selected = availability if date == availability.day
    end

    {
        disabled:  selected ? false : true,
        date:      date.to_formatted_s(:date),
        time_from: selected ? selected.time_from.to_formatted_s(:time) : '00:00',
        time_to:   selected ? selected.time_to.to_formatted_s(:time) : '00:00'
    }

  end

  def select_time_locals(prefix, availability)
    {
        prefix:   prefix,
        disabled: availability[:disabled],
        date:     availability[:date],
        time:     availability["time_#{prefix}".to_sym]
    }

  end

end
