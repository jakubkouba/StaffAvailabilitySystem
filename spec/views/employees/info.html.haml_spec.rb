require 'rails_helper'

RSpec.describe "employees/info.html.haml" do

  before { prepare_employee }

  it "should render employee details" do
    render
    expect(rendered).to have_content 'John'
    expect(rendered).to have_content 'Doe'
    expect(rendered).to have_content 'john.doe@gmail.com'
    expect(rendered).to have_link('Edit', href: '/profile/edit')
  end


end