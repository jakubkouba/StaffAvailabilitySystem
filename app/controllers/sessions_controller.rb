class SessionsController < ApplicationController

  def new
    redirect_to dashboard_employees_path if is_logged_in?
  end

  def create
    @employee = Employee.authenticate(*access_credentials)
    if @employee
      session[:employee_id] = @employee.id
      redirect_to dashboard_employees_path, notice: "Hi #{@employee.name}, you've been successfully logged in"
    else
      flash.now[:login_error] = 'Incorrect email or password'
      render :new
    end

  end

  def destroy
    session[:employee_id] = nil
    redirect_to login_path, notice: "You've been successfully logged out"
  end

  private

  def access_credentials
    [params[:email], params[:password]]
  end
end
