module MarkupHelper

  def main_title(title)
    haml_tag :h2 do
      haml_concat title
    end
  end

end