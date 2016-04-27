require 'rails_helper'

RSpec.describe AvailabilitiesController, type: :controller do

  it_expects_authorization_for(:show)

  describe "GET #show" do

    before do
      @employee_id = login_employee
      get :show, nil, employee_id: @employee_id
    end

    it "assigns current date to @current_date" do
      expect(assigns(:availabilities)).to be_an_instance_of(Facades::Availabilities)
    end

  end

end
