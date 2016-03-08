require 'rails_helper'

RSpec.describe 'Employee Login', :type => :feature do

  let(:employee) { create(:post_request_employee) }

  feature 'Employee wants to log in' do

    it 'should logs in employees and take them to dashboard' do
      visit login_path

      within('form.login-form') do
        fill_in 'email', with: employee.email
        fill_in 'password', with: employee.password
        click_button 'Log In'
      end

      expect(current_path).to eq('/profile/dashboard')
      expect(page).to have_content "Hi #{employee.name} #{employee.surname}, welcome to SAS"
    end
  end
end