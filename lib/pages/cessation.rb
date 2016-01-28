# page object for entering cessation date in session 1
class Cessation
  include Capybara::DSL

  def open
    find('#cessation_date_selector').click
  end

  def pick_date
    find('.dw-mon', text: Date.today.strftime('%B')).click
  end

  def visible?
    find('strong', text: 'Cessation date scheduled for: ' \
                         "#{Date.today.strftime('%m/%d/%Y')}")
  end

  def assert_on_ending2
    find('.well', text: Date.today.strftime('%b. %-d'))
  end
end
