class SessionsController < ApplicationController

  def new
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
  end

  private

  def access_credentials
    [params[:email], params[:password]]
  end
end
