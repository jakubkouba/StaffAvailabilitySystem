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

  let(:staff_types) { StaffType.all.pluck(:id).sample(2) }

  let(:valid_attributes) { attributes_for(:post_request_employee) }

  let(:invalid_attributes) {attributes_for(:invalid_employee, staff_types: staff_types)}

  it_expects_authorization_for(:dashboard, :edit)

  describe "GET #new" do

    before { get :new }

    it { is_expected.to respond_with(200) }

    it { is_expected.to render_template(:new) }

    it 'create new employee object' do
      expect(assigns[:employee]).to be_a_new(Employee)
    end

    it 'assigns @shirt_sizes' do
      expect(assigns[:shirt_sizes]).to eq INIT_VALS[:shirt_sizes]
    end

    it 'assigns @staff_types' do
      expect(assigns[:staff_types]).to eq StaffType.all
    end

    it 'assigns @access_levels to nil' do
      expect(assigns(:access_levels)).to be_nil
    end

    describe "redirects to dashboard when logged in" do

      before do
        @employee             = create(:post_request_employee)
        session[:employee_id] = @employee.id
        get :new, nil, employee_id: @employee.id
      end

      it {is_expected.to redirect_to('/profile/dashboard')}

    end

  end

  describe "POST #create" do

    context 'with valid params' do

      it 'creates new employee' do
        expect { post :create, employee: valid_attributes }.to change(Employee, :count).by(1)
      end

      it 'assigns staff type ids' do
        post :create, employee: valid_attributes
        expect(assigns(:employee).staff_types.size).not_to eq(0)
      end

      it 'assigns newly created employee as @employee' do
        post :create, employee: valid_attributes
        expect(assigns(:employee)).to be_a(Employee)
      end

      it 'redirects to create profile confirmation page' do
        post :create, employee: valid_attributes
        expect(response).to redirect_to(login_path)
        expect(flash[:notice]).to eq 'Your account was successfully created'
      end
    end

    context 'with invalid params' do

      render_views
      it 'assigns new created employee to @employee' do
        post :create, employee: invalid_attributes
        expect(assigns(:employee)).to be_a(Employee)
      end

      it 'renders new template' do
        post :create, employee: invalid_attributes
        expect(response).to render_template(:new)
        expect(response).to have_http_status(200)
      end

    end

  end

  describe "GET #dashboard" do

    let(:employee) { create(:post_request_employee) }
    before { get :dashboard, nil, { employee_id: employee.id } }

    it 'assigns employee from session to @employee' do
      expect(assigns(:employee).id).to eq employee.id
    end
  end

  # describe "GET #show" do
  #   it "returns http success" do
  #     get :show
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #update" do
  #   it "returns http success" do
  #     get :update
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #destroy" do
  #   it "returns http success" do
  #     get :destroy
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
