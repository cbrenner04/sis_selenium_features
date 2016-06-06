# frozen_string_literal: true
# Values for exercises inserted into localStorage for various examples
# These are currently not being used as they don't have the desired effect
module Exercises
  KEY = 'exercises'

  GOOD_INST = [
    { 'id': 1,
      'instruction': 'describe the 1st good thing that happened to you here' },
    { 'id': 2,
      'instruction': 'describe the 2nd good thing that happened to you here' },
    { 'id': 3,
      'instruction': 'describe the 3rd good thing that happened to you here' }
  ].freeze

  KIND_INST = [
    { 'id': 1, 'instruction': 'describe an act of kindness you did today' },
    { 'id': 2, 'instruction': 'describe an act of kindness you saw someone ' \
                              'else do today' }
  ].freeze

  SAVOR_INST = [
    { 'id': 1,
      'instruction': 'describe your 1st experience that you savored here' },
    { 'id': 2,
      'instruction': 'describe your 2nd experience that you savored here' }
  ].freeze

  ALL = [
    { 'exerciseDay' => (DateTime.now - 4).iso8601(3),
      'type' => 'exercises',
      'exerciseName' => 'Three Good Things',
      'description' => 'Please describe three good things that happened to ' \
                       'you today:',
      'instructions' => GOOD_INST,
      'id' => '4fafa27b-2d31-4050-a951-a9b18d85078f',
      'isDirty' => true },
    { 'exerciseDay' => (DateTime.now - 3).iso8601(3),
      'type' => 'exercises',
      'exerciseName' => 'Experiencing Kindness',
      'description' => 'Please describe two acts of kindness: a kindness you' \
                       ' did, and a kindness you saw someone else do today.:',
      'instructions' => KIND_INST,
      'id' => '10cce190-354e-489b-a14c-1971673da8dd',
      'isDirty' => true },
    { 'exerciseDay' => (DateTime.now - 2).iso8601(3),
      'type' => 'exercises',
      'exerciseName' => 'Savoring',
      'description' => 'Please describe experiences that you savored in the ' \
                       'past four ' \
      'hours:', 'instructions' => SAVOR_INST,
      'id' => '6df7d11c-41c0-45ed-878d-42d370bd9486',
      'isDirty' => true }
  ].to_json
end
