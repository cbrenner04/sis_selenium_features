# page object for settings page
class SettingsPage
  include Capybara::DSL

  def assert_on_page
    find('h3', text: 'Set Up')
  end

  def save
    save_button.click
  end

  private

  def save_button
    find('#save_button')
  end
end
