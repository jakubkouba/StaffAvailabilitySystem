Date::DATE_FORMATS[:input] = "%d/%m/%Y"
Date::DATE_FORMATS[:db] = ->(date) { date.to_formatted_s(:iso8601)}