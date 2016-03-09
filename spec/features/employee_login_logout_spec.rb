require 'rails_helper'

RSpec.describe 'Employee Login / Log out', :type => :feature do

  let(:employee) { create(:post_request_employee) }
  subject { page }

  before do
    visit login_path
    within('form.login-form') do
      fill_in 'email', with: employee.email
      fill_in 'password', with: employee.password
      click_button 'Log In'
    end
  end

  it { is_expected.to have_link('Log out', href: '/log_out') }
  it { is_expected.to have_content "Hi #{employee.name} #{employee.surname}, welcome to SAS" }

  it 'has right location' do
    expect(current_path).to eq('/profile/dashboard')
  end

  it 'logs employee out' do
    click_link('Log out', href: '/log_out')
    expect(page).to have_content "You've been successfully logged out"
  end

end