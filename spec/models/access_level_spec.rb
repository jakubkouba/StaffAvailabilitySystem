# == Schema Information
#
# Table name: access_levels
#
#  id    :integer          not null, primary key
#  title :string(255)
#

require 'rails_helper'
require 'support/check_seed_population'
require 'support/assignable_for_employee'

RSpec.describe AccessLevel, type: :model do

  access_level = INIT_VALS[:access_levels]

  it_behaves_like 'db:seed validable', described_class, :title, access_level

  it_behaves_like 'assignable for employee', described_class, access_level

end
