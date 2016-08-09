# frozen_string_literal: true

require './lib/pages/users/csv_downloads'
require './lib/pages/users/login'

def csv_login
  @csv_login ||= Users::Login.new
end

def csv
  @csv ||= Users::Csv.new
end

feature 'A user checks CSV for', metadata: :user do
  background do
    visit ENV['Dash_URL']
    csv_login.sign_in
  end

  scenario 'Cessation dates' do
    csv.check_labels(
      report: 'Cessation dates',
      expected_labels: ['Id', 'Uuid', 'Cessation on',
                        'Created at', 'Updated at']
    )
  end

  scenario 'Cessation reasons' do
    csv.check_labels(
      report: 'Cessation reasons',
      expected_labels: ['Id', 'Description', 'Created at',
                        'Updated at', 'Uuid'])
  end

  scenario 'Devices' do
    csv.check_labels(
      report: 'Devices',
      expected_labels: ['Id', 'Device uuid', 'Device manufacturer',
                        'Device model', 'Device platform',
                        'Device version', 'Uuid', 'Created at',
                        'Updated at'])
  end

  scenario 'Emas' do
    csv.check_labels(
      report: 'Emas',
      expected_labels: ['Id', 'Assessment type', 'Created at',
                        'Updated at', 'Uuid', 'Assessment date'])
  end

  scenario 'Ema question answers' do
    csv.check_labels(
      report: 'Ema question answers',
      expected_labels: ['Id', 'Participant', 'Question',
                        'Answer', 'Created at',
                        'Updated at', 'Uuid'])
  end

  scenario 'Participants' do
    csv.check_labels(
      report: 'Participants',
      expected_labels: ['Id', 'External', 'Smoking status',
                        'Created at', 'Updated at'])
  end

  scenario 'Participant exercises' do
    csv.check_labels(
      report: 'Participant exercises',
      expected_labels: ['Id', 'Exercise name',
                        'Created at', 'Updated at',
                        'Uuid', 'Exercise day',
                        'Description', 'Instructions'])
  end

  scenario 'Participant exercise question answers' do
    csv.check_labels(
      report: 'Participant exercise question answers',
      expected_labels: ['Id', 'Participant exercise', 'Answer',
                        'Created at', 'Updated at', 'Uuid'])
  end

  scenario 'Participant sessions' do
    csv.check_labels(
      report: 'Participant sessions',
      expected_labels: ['Id', 'Session type', 'Uuid',
                        'Session date', 'Created at'])
  end

  scenario 'Participant session question answers' do
    csv.check_labels(
      report: 'Participant session question answers',
      expected_labels: ['Id', 'Question', 'Answer', 'Created at', 'Updated at',
                        'Uuid', 'Participant', 'Session'])
  end

  scenario 'Risky smoking times' do
    csv.check_labels(
      report: 'Risky smoking times',
      expected_labels: ['Id', 'Risky time', 'Created at',
                        'Updated at', 'Strategy', 'Uuid',
                        'Notification'])
  end

  scenario 'Smoking statuses' do
    csv.check_labels(
      report: 'Smoking statuses',
      expected_labels: ['Id', 'Description', 'Created at',
                        'Updated at', 'Uuid', 'Status date'])
  end

  scenario 'Social supports' do
    csv.check_labels(
      report: 'Social supports',
      expected_labels: ['Id', 'Name', 'Reason', 'Created at',
                        'Updated at', 'Uuid'])
  end

  scenario 'User' do
    csv.check_labels(
      report: 'User',
      expected_labels: ['Id', 'Email', 'Reset password sent at',
                        'Remember created at', 'Sign in count', 'Signed in at',
                        'Last signed in at', 'Current sign in ip',
                        'Last sign in ip', 'Created at', 'Updated at'])
  end

  scenario 'View events' do
    csv.check_labels(
      report: 'View events',
      expected_labels: ['Id', 'Uuid', 'Page name', 'Occurred at',
                        'Created at', 'Updated at'])
  end
end
