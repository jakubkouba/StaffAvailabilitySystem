module SessionsHelper

  def self.included(base)
    base.extend(ClassMethods)
  end

  def current_employee
    @employee ||= Employee.find(session[:employee_id]) if session[:employee_id]
  end

  def is_logged_in?
    !session[:employee_id].nil?
  end

  def check_login
    unless is_logged_in?
      redirect_to login_path, notice: 'You must be logged in'
    end
  end

  module ClassMethods

    def ensure_employee_presence_and_auth(inc_ex_actions)
      before_action :current_employee, :check_login, inc_ex_actions
    end

  end



end