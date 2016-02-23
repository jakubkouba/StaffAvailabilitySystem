require 'rails_helper'

RSpec.describe IndexController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response.status).to eq(200)

    end
  end

  describe "GET #login" do
    it "returns http success" do
      get :login
      expect(response).to have_http_status(:success)
    end
  end

end
