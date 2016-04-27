# == Schema Information
#
# Table name: employees
#
#  id            :integer          not null, primary key
#  name          :string(64)       not null
#  surname       :string(64)       not null
#  date_of_birth :date             not null
#  email         :string(64)       not null
#  shirt_size    :integer          default(0)
#  password_hash :string(128)      not null
#  password_salt :string(128)      not null
#  last_login    :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

module EmployeesHelper

  def form_field_box(field, errors)
    class_name = field.to_s.gsub('_', '-')
    haml_tag :div, class: "field #{class_name} columns small-12 medium-6 large-6" do
      yield
      if errors[field]
        haml_tag :p, class: "help-text form-field-error #{class_name}-error" do
          haml_concat errors[field].first
        end
      end
    end
  end

  def build_text_field(form_builder_obj, attr)
    html        = ''
    placeholder = PROFILE_FORM_FIELD_DESCRIPTIONS[attr][:placeholder].nil? ? {}: { placeholder: PROFILE_FORM_FIELD_DESCRIPTIONS[attr][:placeholder] }
    html << form_builder_obj.send(:label, attr)
    html << form_builder_obj.send(:text_field, attr, placeholder)
    unless PROFILE_FORM_FIELD_DESCRIPTIONS[attr][:help_text].nil?
      html << capture_haml do
                help_text(PROFILE_FORM_FIELD_DESCRIPTIONS[attr][:help_text])
              end
    end
    html.html_safe
  end

  def help_text(text)
    haml_tag :p, class: 'help-text' do
      haml_concat text
    end
  end

  def render_menu
    content_for :menu do
      render 'employees/partials/menu'
    end
  end

end