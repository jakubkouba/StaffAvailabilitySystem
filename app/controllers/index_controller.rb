class IndexController < ApplicationController

  ensure_employee_presence_and_auth :index

  def index
  end
end
