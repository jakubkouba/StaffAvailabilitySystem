# == Schema Information
#
# Table name: staff_types
#
#  id    :integer          not null, primary key
#  title :string(64)
#

require 'rails_helper'
require 'support/check_seed_population'
require 'support/assignable_for_employee'

RSpec.describe StaffType, type: :model do

  staff_types = INIT_VALS[:staff_types]

  it_behaves_like 'db:seed validable', described_class, :title, staff_types

  it_behaves_like 'assignable for employee', described_class, staff_types

end
