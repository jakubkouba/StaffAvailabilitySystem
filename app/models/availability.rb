# == Schema Information
#
# Table name: availabilities
#
#  employee_id :integer
#  day         :date             not null
#  time_from   :datetime         not null
#  time_to     :datetime         not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_availabilities_on_employee_id  (employee_id)
#

class Availability < ActiveRecord::Base
  belongs_to :employee

  validates :day,
            :time_from,
            :time_to,
            presence: true


  def self.update(new_availabilities, employee_id)
    availability_collection = self.create_collection(new_availabilities, employee_id)
    if availability_collection.any?
      Availability.where(employee_id: employee_id).delete_all
      availability_collection.each { |availability| availability.save }
      true
    else
      false
    end
  end

  private

  ##
  # Create collection of single availability objects
  #
  # @param availabilities params['available-times']
  def self.create_collection(availabilities, employee_id)
    collection = []
    availabilities.each do |date, times|
      availability = Availability.new({ employee_id: employee_id,
                                        day:         date,
                                        time_from:   self.create_time_obj(times['from']),
                                        time_to:     self.create_time_obj(times['to'])
                                      })

      collection << availability if availability.valid?
    end
    collection
  end

  def self.create_time_obj(time)
    time = time.split(':')
    if time.size == 2
      time.each { |time_fragment| return nil unless time_fragment.match(/\d{2}/) }
      hour, minute = time[0], time[1]
      hour > '24' || minute > '60' ? nil : Time.new(0, 1, 1, hour, minute).strftime("%H:%M:%S")
    end
  end

end
