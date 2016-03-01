## This is shared example for testing if init values has been inserted into DB

require 'rails_helper'

RSpec.shared_examples 'init value check' do |model, attr, key|

  it 'should contain default values' do
    init_vals = model.all.pluck(attr)
    default = INIT_VALS[key]
    expect((init_vals & default).sort).to eq default.sort
  end

end