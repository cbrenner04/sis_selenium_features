# page object for session two
class SessionTwo
  include Capybara::DSL

  def available_soon?
    within('.row', text: 'session 2') do
      find('.label-warning')
    end
  end

  def available?
    within('.row', text: 'session 2') do
      find('.label-success')
    end
  end

  def completed?
    within('.row', text: 'session 2') do
      find('.label-success')
      find('.glyphicon.glyphicon-check.glyphicon-sm')
    end
  end
end
