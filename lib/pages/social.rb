# frozen_string_literal: true
# page object for social supports in session 1
class SocialSupport
  include Capybara::DSL

  def initialize(name)
    @name = name
  end

  def create
    fill_in 'name', with: @name
    find('#reason').click
    find("option[value = 'He/she will offer encouragement along the way.'")
      .click
  end

  def open
    find('.btn-info', text: 'YOUR SOCIAL SUPPORT').click
  end

  def visible?
    within well do
      has_css?('.cessation-reason-row', text: @name) &&
        has_css?('.cessation-reason-row',
                 text: 'He/she will offer encouragement along the way.') &&
        has_css?('.glyphicon-remove')
    end
  end

  def has_two_supports_present?
    well.has_css?('.glyphicon-remove', count: 2)
  end

  def remove
    find('.glyphicon-remove').click
  end

  def has_test_social_support_present?
    has_css?('.modal-well', text: 'Test Smith')
  end

  private

  def well
    find('.modal-well')
  end
end
