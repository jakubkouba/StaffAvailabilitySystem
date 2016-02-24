require 'rails_helper'

RSpec.describe "index/index.html.haml", type: :view do

  it 'displays create account link' do
    render
    expect(rendered).to match /class="create-account-link"/
  end

  it 'displays login link' do
    render
    expect(rendered).to match /class="login-link"/
  end
end
