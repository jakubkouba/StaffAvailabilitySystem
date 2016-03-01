# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


## Populate StaffTypes
class SasDbPopulate

  class << self
    def populate_by(model, attr, key)
      INIT_VALS[key].each { |value| model.find_or_create_by(attr => value) }
    end
  end
end

SasDbPopulate.populate_by(StaffType, :title, :staff_types)
SasDbPopulate.populate_by(AccessLevel, :title, :access_levels)