# == Schema Information
#
# Table name: staff_types
#
#  id    :integer          not null, primary key
#  title :string(64)
#

require 'rails_helper'

RSpec.describe StaffType, type: :model do

  it 'should contain default values' do
    types = StaffType.all.pluck(:title)
    default = INIT_VALS[:staff_types]
    expect((types & default).sort).to eq default.sort
  end

end
