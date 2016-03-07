require 'rails_helper'

RSpec.describe "Create employee profile", :type => :feature do

  scenario "creates profile" do
    visit new_employees_path

    within('form#new_employee') do
      fill_in 'Name', with: 'James'
      fill_in 'Surname', with: 'Turner'
      fill_in 'Date of birth', with: '06/09/1982'
      fill_in 'Email', with: 'james.turner@domain.com'
      check 'porter'
      check 'vaiter'
      fill_in 'Password', with: 'JamesTurner'
      fill_in 'Password confirmation', with: 'JamesTurner'
      click_on 'Create Profile'
    end

    expect(current_path).to eq(login_path)
    expect(page).to have_content 'Your account was successfully created'
  end

end