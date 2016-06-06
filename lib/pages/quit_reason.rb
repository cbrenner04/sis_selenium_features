# frozen_string_literal: true
# page object for giving a quit reason in session 1
class QuitReason
  include Capybara::DSL

  def initialize(reason)
    @reason = reason
  end

  def open
    find('.btn.btn-info', text: 'YOUR REASONS FOR STOPPING SMOKING').click
  end

  def create
    find('.form-control').set(@reason)
  end

  def visible?
    within('.modal-well') do
      has_css?('.cessation-reason-row', text: @reason) &&
        has_css?('.glyphicon-remove')
    end
  end

  def has_test_reason_present?
    find('.well.modal-well')
      .has_css?('.cessation-reason-row', text: 'Test Reason 1')
  end

  def remove
    first('.glyphicon-remove').click
  end

  def has_two_quit_reasons_present?
    has_css?('.glyphicon-remove', count: 2)
  end
end
