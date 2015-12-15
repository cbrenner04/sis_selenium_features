# page object for social supports in session 1
class SocialSupport < Struct.new(:name)
  include Capybara::DSL

  def assert_on_correct_page
    find('h3', text: 'Enlisting Your Social Support')
  end

  def create
    fill_in 'name', with: name
    find('#reason').click
    find("option[value = 'He/she will offer encouragement along the way.'")
      .click
  end

  def visible?
    within('.well.modal-well') do
      find('.cessation-reason-row', text: "#{name}")
      find('.cessation-reason-row',
           text: 'He/she will offer encouragement along the way.')
      find '.glyphicon-remove.glyphicon-sm'
    end
  end
end
