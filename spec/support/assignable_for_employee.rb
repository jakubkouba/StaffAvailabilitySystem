## This is shared example for testing if init values has been inserted into DB

require 'rails_helper'

RSpec.shared_examples 'assignable for employee' do |model, source|

  it "assigns values from #{model}" do
    employee          = create(:employee)
    search_value      = source.sample
    collection_obj    = model.find_by_title(search_value)
    collection_method = model.to_s.underscore.pluralize
    employee.send(collection_method) << collection_obj
    value_found = employee.send(collection_method).pluck(:title).first
    expect(value_found).to eq search_value
  end

end