require 'rails_helper'

RSpec.describe "employees/new.html.haml", type: :view do

  before(:each) do
    assign(:employee, Employee.new)
    assign(:shirt_sizes, INIT_VALS[:shirt_sizes].map { |size| [size, size]})
    assign(:staff_types, StaffType.all)
  end

  it 'displays "Create Profile"' do
    render
    expect(rendered).to have_content('Create Profile')
  end

  context 'create Profile Form' do

    it 'renders form' do
      render
      expect(rendered).to have_selector('form#new_employee')
    end

    it 'displays shirt sizes' do
      render
      expect(rendered).to have_selector('select#employee_shirt_size')
    end

    #TODO: Does it make a sense to test this?
    # it 'displays staff types' do
    #   render
    #   StaffType.all.pluck(:id).each do |id|
    #     expect(rendered).to match /staff_type/i
    #   end
    # end
  end
end
