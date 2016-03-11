require 'rails_helper'

RSpec.describe "index/index.html.haml", type: :view do

  it 'displays create account link' do
    render
    expect(rendered).to have_link('Create Account', href: '/profile/create')
  end

  it 'displays login link' do
    render
    expect(rendered).to have_link('Login', href: '/login')
  end
end
