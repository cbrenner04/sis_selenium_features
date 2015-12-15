# page object for home page
class UpdateSmokingStatus
  include Capybara::DSL

  def open
    find('.wide.btn.btn-default.btn-sm', text: 'UPDATE YOUR STATUS').click
  end

  def select_preparing_for_quit
    button = page.all('.btn.btn-lg.btn-primary.ng-binding')
    button[0].click
  end

  def select_still_quit
    button = page.all('.btn.btn-lg.btn-primary.ng-binding')
    button[1].click
  end

  def select_slipped
    button = page.all('.btn.btn-lg.btn-primary.ng-binding')
    button[2].click
  end

  def select_not_quitting
    button = page.all('.btn.btn-lg.btn-primary.ng-binding')
    button[3].click
  end
end
