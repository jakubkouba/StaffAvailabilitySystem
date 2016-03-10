module EmployeesHelper

  def form_field_box(title)
    haml_tag :div, class: "field #{title} columns small-12 medium-6 large-6" do
      yield
    end
  end

end