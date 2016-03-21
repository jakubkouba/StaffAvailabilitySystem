module NavigationHelper

  def build_menu_for(type)

    employee_site_map = [
        { title: 'Dashboard', action: 'dashboard', url: dashboard_employees_path },
        { title: 'Edit Profile', action: 'edit', url: edit_employees_path },
        { title: 'Availability', action: 'availbabitity', url: availabilities_path }
    ]

    capture_haml do
      haml_tag :ul do
        case type
          when :employee
            haml_concat header_menu(true)
            haml_concat build_menu(employee_site_map)
        end
      end
    end
  end

  def build_menu(menu_items, link_options = {})
    capture_haml do
      menu_items.each do |item|
        haml_tag :li do
          haml_concat link_to(item[:title], item[:url], link_options)
        end
      end
    end
  end

  def header_menu(list_items_only = false)
    menu_items = [
        { title: 'Log Out', url: log_out_path },
        { title: 'My Profile', url: info_employees_path }
    ]

    html_list = build_menu(menu_items, {class: 'header-link'})

    return html_list if list_items_only

    capture_haml do
      haml_tag :ul do
        haml_concat html_list
      end
    end
  end

end