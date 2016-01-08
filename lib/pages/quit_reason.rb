# page object for giving a quit reason in session 1
class QuitReason < Struct.new(:reason)
  include Capybara::DSL

  def open
    find('.btn.btn-info', text: 'YOUR REASONS FOR STOPPING SMOKING').click
  end

  def create
    find('.form-control').set(reason)
  end

  def visible?
    within('.well.modal-well') do
      find('.cessation-reason-row', text: reason)
      find '.glyphicon.glyphicon-remove.glyphicon-sm'
    end
  end

  def has_test_reason_present?
    within('.well.modal-well') do
      has_css?('.cessation-reason-row', text: 'Test Reason 1')
    end
  end

  def remove
    first('.glyphicon.glyphicon-remove.glyphicon-sm').click
  end

  def has_two_quit_reasons_present?
    has_css?('.glyphicon.glyphicon-remove.glyphicon-sm', count: 2)
  end
end
