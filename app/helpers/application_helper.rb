# frozen_string_literal: true
module ApplicationHelper
  def login_helper(style)
    if current_user.is_a?(User)
      link_to 'Logout', destroy_user_session_path, method: :delete, class: style
    else
      (link_to 'Register', new_user_registration_path, class: style) +
        ''.html_safe +
        (link_to 'Login', new_user_session_path, class: style)
    end
  end
end
