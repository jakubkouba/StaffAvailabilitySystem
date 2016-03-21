module ControllerMacros

  def self.included(base)
    base.extend(ClassMethods)
  end

  def login_employee
    employee = FactoryGirl.create(:post_request_employee)
    session[:employee_id] = employee.id
    employee.id
  end

  module ClassMethods

    def it_expect_assign_employee
      it "assigns @employee" do

      end
    end


    def it_expects_authorization_for(*actions)
      describe "authorization" do

        context "invalid" do
          actions.each do |action|
            it "require login for #{action}" do
              get action, nil, { employee_id: nil }
              expect(response).to redirect_to(login_path)
              expect(flash[:notice]).to eq 'You must be logged in'
            end
          end
        end

        context "valid" do

          render_views
          before(:each) do
            @employee_id = login_employee
          end

          actions.each do |action|
            it "displays #{action} view and menu if user logged in" do
              get action, nil, { employee_id: @employee_id }
              expect(response).to render_template(action)
              expect(response).to render_template(layout: 'layouts/application')
              expect(response.body).to have_selector('.employee-menu')
            end

            it "get current employee" do
              get action, nil, { employee_id: @employee_id }
              expect(assigns(:employee)).to be_an_instance_of(Employee)
            end
          end
        end
      end
    end
  end
end