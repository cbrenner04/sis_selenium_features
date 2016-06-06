# frozen_string_literal: true
# page object for general navigation
class Navigation
  include Capybara::DSL

  def reload
    execute_script('window.location.reload()')
  end

  def clear_data
    execute_script('localStorage.clear()')
  end
end
