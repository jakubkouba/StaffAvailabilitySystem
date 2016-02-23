require 'rails_helper'

RSpec.describe "index/index.html.haml", type: :view do
  it 'displays "This is home page"' do
    render
    expect(rendered).to match /Home page/
  end
end
