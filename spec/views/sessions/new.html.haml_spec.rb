require 'rails_helper'

RSpec.describe "sessions/new.html.haml", type: :view do
  context 'Login form' do
    it 'displays email and password field' do
      render
      expect(rendered).to have_field('email', type: 'email')
      expect(rendered).to have_field('password')
      expect(rendered).to have_button('Log In')
      expect(rendered).to have_link('Create Profile', href: '/profile/create')
    end
  end
end
