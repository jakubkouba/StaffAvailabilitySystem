require 'rails_helper'

RSpec.describe "employees/new.html.haml", type: :view do

  before(:each) do
    assign(:employee, Employee.new)
    assign(:shirt_sizes, INIT_VALS[:shirt_sizes].map { |size| [size, size]})
  end

  it 'displays "Create Profile"' do
    render
    expect(rendered).to match /Create Profile/
  end

  it 'displays Profile form' do
    render :partial => 'profile_form.html.haml'
    expect(rendered).to match /id="new_employee"/
  end


end
