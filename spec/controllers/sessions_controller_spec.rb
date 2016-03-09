require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success and renders new template" do
      get :new
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do

    let(:employee) { create(:post_request_employee) }

    context 'with valid access credentials' do

      before(:each) { post :create, { email: employee.email, password: employee.password } }

      it 'finds and assigns Employee object to @employee' do
        expect(assigns(:employee)).to eq(employee)
      end

      it 'assign employee id to session' do
        expect(session[:employee_id]).to eq(employee.id)
      end

      it 'redirects to employee home page' do
        expect(response).to redirect_to('/profile/dashboard')
        expected_text = "Hi #{employee.name}, you've been successfully logged in"
        expect(flash[:notice]).to eq(expected_text)
      end

    end

    context 'with invalid access credentials' do

      before(:each) do
        employee.email = 'incorrect_email'
        post :create, { email: employee.email, password: employee.password }
      end

      render_views

      it { is_expected.to render_template(:new) }

      it 'displays error message' do
        expect(response.body).to have_text 'Incorrect email or password'
      end

    end

  end

  describe "GET #destroy" do

    before { get :destroy }

    it "destroy session and redirects to login" do
      expect(session[:employee_id]).to be_nil
      expect(response).to redirect_to('/login')
      expect(flash[:notice]).to eq("You've been successfully logged out")
    end
  end

end
