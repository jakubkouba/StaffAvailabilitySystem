module NavigationHelper

  def build_menu_for(type)

    employee_site_map = [
        { title: 'Dashboard', action: 'dashboard', url: dashboard_employees_path },
        { title: 'Edit Profile', action: 'edit', url: edit_employees_path },
        { title: 'Availability', action: 'availbabitity', url: availability_employees_path }
    ]

    capture_haml do
      haml_tag :ul do
        case type
          when :employee
            haml_concat build_menu(employee_site_map)
        end
      end
    end
  end

  def build_menu(site_map)
    capture_haml do
    site_map.each do |info|
        haml_tag :li do
          haml_concat link_to(info[:title], info[:url])
        end
      end
    end
  end

  def header_menu
    menu_items = [
        { title: 'Log Out', url: log_out_path },
        { title: 'My Profile', url: info_employees_path }
    ]

    capture_haml do
      haml_tag :ul do
        menu_items.each do |info|
          haml_tag :li do
            haml_concat link_to info[:title], info[:url]
          end
        end
      end
    end
  end

end