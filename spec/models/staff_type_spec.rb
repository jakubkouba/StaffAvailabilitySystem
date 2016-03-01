# == Schema Information
#
# Table name: staff_types
#
#  id    :integer          not null, primary key
#  title :string(64)
#

require 'rails_helper'
require 'support/check_presence_of_init_values'

RSpec.describe StaffType, type: :model do

  it_behaves_like 'init value check', described_class, :title, :staff_types

end
