module NavigationHelper

  def build_menu_for(type)

    employee_site_map = [
        { title: 'Dashboard', action: 'dashboard', url: dashboard_employees_path },
        { title: 'Edit Profile', action: 'edit', url: edit_employees_path },
        { title: 'Availability', action: 'availbabitity', url: availability_employees_path }
    ]

    menu = capture_haml do
      haml_tag :ul do
        case type
          when :employee
            haml_concat build_menu(employee_site_map)
        end
      end
    end
    menu
  end

  def build_menu(site_map)
    list = capture_haml do
    site_map.each do |info|
        haml_tag :li do
          haml_concat link_to_if(action_name != info[:action], info[:title], info[:url])
        end
      end
    end
    list
  end

end