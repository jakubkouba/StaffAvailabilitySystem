require 'rails_helper'

RSpec.feature "Index page", type: :feature do

  before :each do
    visit home_path
  end

  scenario 'redirect user to create profile page' do
    create_account_link = find_link('Create Account', { href: new_employees_path })
    create_account_link.click
    expect(current_path).to eq(new_employees_path)
  end

  scenario 'redirect user to login page' do
    login_link = find_link('Login', { href: login_path })
    login_link.click
    expect(current_path).to eq(login_path)
  end

end
