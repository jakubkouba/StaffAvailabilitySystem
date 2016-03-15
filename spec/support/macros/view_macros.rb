module ViewMacros

  def self.included(base)
    base.extend(ClassMethods)
  end

  def prepare_employee
    @employee = create(:post_request_employee)
  end

  module ClassMethods

  end

end