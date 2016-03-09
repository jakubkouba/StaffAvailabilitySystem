module SessionsHelper

  def current_employee
    @employee ||= Employee.find(session[:employee_id]) if session[:employee_id]
  end

end