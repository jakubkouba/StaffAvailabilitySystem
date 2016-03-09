module SessionsHelper

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

end