module ControllerMacros

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def it_expects_to_be_logged_for(*actions)
      actions.each do |action|
        it "verifies if user is logged in for #{action}"  do
          get action, nil, { employee_id: nil }
          expect(response).to redirect_to(login_path)
          expect(flash[:notice]).to eq 'You must be logged in'
        end
      end
    end
  end
end