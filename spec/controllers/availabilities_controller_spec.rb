require 'rails_helper'

RSpec.describe AvailabilitiesController, type: :controller do

  describe "GET #show" do

    before { get :show }

    it_expects_authorization_for(:show)

  end

end
