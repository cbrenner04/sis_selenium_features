# page object for home page
class UpdateSmokingStatus
  include Capybara::DSL

  def open
    find('.btn-default', text: 'UPDATE YOUR STATUS').click
  end

  def select_preparing_for_quit
    button[0].click
  end

  def select_still_quit
    button[1].click
  end

  def select_slipped
    button[2].click
  end

  def select_not_quitting
    button[3].click
  end

  private

  def button
    page.all('.btn-primary')
  end
end
