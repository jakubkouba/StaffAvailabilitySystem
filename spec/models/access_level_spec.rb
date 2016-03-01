# == Schema Information
#
# Table name: access_levels
#
#  id    :integer          not null, primary key
#  title :string(255)
#

require 'rails_helper'
require 'support/check_presence_of_init_values'

RSpec.describe AccessLevel, type: :model do

  it_behaves_like 'init value check', described_class, :title, :access_levels


end
