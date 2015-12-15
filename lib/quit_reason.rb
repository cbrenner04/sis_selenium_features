# page object for giving a quit reason in session 1
class QuitReason < Struct.new(:reason)
  include Capybara::DSL

  # def initialize(reason)
  #   @reason = reason
  # end

  def assert_on_correct_page
    find('h3', text: 'Your Reasons for Quitting Smoking')
  end

  def create
    fill_in 'reason', with: reason
  end

  def visible?
    within('.well.modal-well') do
      find('.cessation-reason-row', text: reason)
      find '.glyphicon.glyphicon-remove.glyphicon-sm'
    end
  end
end
