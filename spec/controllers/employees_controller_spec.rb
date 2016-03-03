# == Schema Information
#
# Table name: employees
#
#  id            :integer          not null, primary key
#  name          :string(64)       not null
#  surname       :string(64)       not null
#  date_of_birth :date             not null
#  email         :string(64)       not null
#  shirt_size    :integer          default(0)
#  password_hash :string(128)      not null
#  password_salt :string(128)      not null
#  last_login    :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe EmployeesController, type: :controller do

  describe "GET #new" do

    before { get :new }

    it { is_expected.to respond_with(200) }

    it { is_expected.to render_template(:new) }

    it 'create new employee object' do
      expect(assigns[:employee]).to be_a_new(Employee)
    end

    it 'assigns @shirt_sizes' do
      expect(assigns[:shirt_sizes]).to eq INIT_VALS[:shirt_sizes].map { |size| [size, size] }
    end

    it 'assigns @staff_types' do
      expect(assigns[:staff_types]).to eq StaffType.all
    end

    it 'assigns @access_levels to nil' do
      expect(assigns(:access_levels)).to be_nil
    end

  end

  describe "POST #create" do

    let(:staff_types) { StaffType.all.pluck(:id).sample(2) }
    let(:valid_attributes) { attributes_for(:employee, staff_types: staff_types) }

    context 'with valid params' do

      it 'creates new employee' do
        expect { post :create, employee: valid_attributes }.to change(Employee, :count).by(1)
      end

      it 'assigns newly created employee as @employee' do
        post :create, employee: valid_attributes
        expect(assigns(:employee)).to be_a(Employee)
      end

      it 'redirects to create profile confirmation page' do
        post :create, employee: valid_attributes
        expect(response).to redirect_to('/profile/confirmation')
      end


    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    it "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

end
