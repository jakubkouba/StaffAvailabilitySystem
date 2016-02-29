require 'rails_helper'

RSpec.describe "employees/new.html.haml", type: :view do

  before(:each) do
    render
  end

  it 'displays "Create Profile"' do
    expect(rendered).to match /Create Profile/
  end

end
