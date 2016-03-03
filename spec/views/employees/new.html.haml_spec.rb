require 'rails_helper'

RSpec.describe "employees/new.html.haml", type: :view do

  before(:each) do
    assign(:employee, Employee.new)
    assign(:shirt_sizes, INIT_VALS[:shirt_sizes].map { |size| [size, size]})
    assign(:staff_types, StaffType.all)
  end

  it 'displays "Create Profile"' do
    render
    expect(rendered).to match /Create Profile/
  end

  context 'create Profile Form' do

    it 'renders form' do
      render
      expect(rendered).to match /create-profile-form/i
    end

    it 'displays shirt sizes' do
      render
      expect(rendered).to match /shirt size/i
    end

    it 'displays staff types' do
      render
      expect(rendered).to match /staff_type/i
    end

    it 'displays access levels' do
      assign(:access_levels, AccessLevel.all)
      render
      expect(rendered).to match /authorization/i
    end

    end
end
