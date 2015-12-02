# Values for authenticationToken inserted into localStorage for various examples
module AuthToken
  KEY = 'authenticationToken'
  AUTH_1 = '[{"value":"e763120072b8410fad40993f44619388","isDirty":true}]'
end

# Values for cessationDate inserted into localStorage for various examples
module CessationDate
  KEY = 'cessationDate'
  date_1 = DateTime.now + 4
  date_2 = DateTime.now - 8
  date_3 = DateTime.now - 7
  DATE_1 = [{ 'cessationDay' => date_1.iso8601(3),
              'id' => '12b8b230-0b4d-4a0b-b1ab-d3f7b55d029c',
              'type' => 'cessationDate', 'isDirty' => true }].to_json
  DATE_2 = [{ 'cessationDay' => DateTime.now.iso8601(3),
              'id' => 'dede6ca2-00f2-41cf-a61e-f066c55e25d4',
              'type' => 'cessationDate', 'isDirty' => true }].to_json
  DATE_3 = [{ 'cessationDay' => date_2.iso8601(3),
              'id' => '3f784af9-3745-4e89-a27a-ae6229c1b34b',
              'type' => 'cessationDate', 'isDirty' => true }].to_json
  DATE_4 = [{ 'cessationDay' => date_3.iso8601(3),
              'id' => 'adsfwef9-3745-4e89-a27a-eg6asdf1b34b',
              'type' => 'cessationDate', 'isDirty' => true }].to_json
end

# Values for cessationReasons inserted into localStorage for various examples
module CessationReasons
  KEY = 'cessationReasons'
  REASON_1 = '[{"description":"Test Reason 1","id":"517d4c2f-da8c-45ae-9e8e-' \
             '1359a0c19dd3","type":"cessationReasons","isDirty":true}]'
end

# Values for exercises inserted into localStorage for various examples
module Exercises
  KEY = 'exercises'
  GOOD_THINGS = '[{"exerciseDay":"2015-10-15","type":"exercises","exerciseNa' \
                'me":"Three Good Things","description":"Please describe thre' \
                'e good things that happened to you today:","instructions":[' \
                '{"id":1,"instruction":"describe the 1st good thing that hap' \
                'pened to you here"},{"id":2,"instruction":"describe the 2nd' \
                ' good thing that happened to you here"},{"id":3,"instructio' \
                'n":"describe the 3rd good thing that happened to you here"}' \
                '],"id":"4fafa27b-2d31-4050-a951-a9b18d85078f","isDirty":true}]'
  EXP_KIND = '[{"exerciseDay":"2015-10-15","type":"exercises","exerciseName"'\
             ':"Experiencing Kindness","description":"Please describe two ac' \
             'ts of kindness: a kindness you did, and a kindness you saw som' \
             'eone else do today.:","instructions":[{"id":1,"instruction":"d' \
             'escribe an act of kindness you did today"},{"id":2,"instructio' \
             'n":"describe an act of kindness you saw someone else do today"' \
             '}],"id":"10cce190-354e-489b-a14c-1971673da8dd","isDirty":true}]'
  SAVORING = '[{"exerciseDay":"2015-10-15","type":"exercises","exerciseName"' \
             ':"Savoring","description":"Please describe experiences that yo' \
             'u savored in the past four hours:","instructions":[{"id":1,"in' \
             'struction":"describe your 1st experience that you savored here' \
             '"},{"id":2,"instruction":"describe your 2nd experience that yo' \
             'u savored here"}],"id":"6df7d11c-41c0-45ed-878d-42d370bd9486",' \
             '"isDirty":true}]'
end

# Values for participantExerciseQuestionAnswers for localStorage for examples
module ExerciseAnswers
  KEY = 'participantExerciseQuestionAnswers'
  GOOD_THINGS_ALL = '[{"answer":"test","exerciseId":"4fafa27b-2d31-4050-a951' \
                    '-a9b18d85078f","id":"6ad3b7eb-2d68-46bc-8276-bfda33b326' \
                    '86","type":"participantExerciseQuestionAnswers","isDirt' \
                    'y":true},{"answer":"test","exerciseId":"4fafa27b-2d31-4' \
                    '050-a951-a9b18d85078f","id":"30faaa5d-1571-4af6-9901-2a' \
                    '809256a8d7","type":"participantExerciseQuestionAnswers"' \
                    ',"isDirty":true},{"answer":"test","exerciseId":"4fafa27' \
                    'b-2d31-4050-a951-a9b18d85078f","id":"0fe916dc-7d04-4404' \
                    '-b16c-d23ef68540ff","type":"participantExerciseQuestion' \
                    'Answers","isDirty":true}]'
  GOOD_THINGS_1 = '[{"answer":"test","exerciseId":"4fafa27b-2d31-4050-a951-a' \
                  '9b18d85078f","id":"6ad3b7eb-2d68-46bc-8276-bfda33b32686",' \
                  '"type":"participantExerciseQuestionAnswers","isDirty":true}]'
  GOOD_THINGS_2 = '[{"answer":"test","exerciseId":"4fafa27b-2d31-4050-a951-a' \
                  '9b18d85078f","id":"6ad3b7eb-2d68-46bc-8276-bfda33b32686",' \
                  '"type":"participantExerciseQuestionAnswers","isDirty":tru' \
                  'e},{"answer":"test","exerciseId":"4fafa27b-2d31-4050-a951' \
                  '-a9b18d85078f","id":"30faaa5d-1571-4af6-9901-2a809256a8d7' \
                  '","type":"participantExerciseQuestionAnswers","isDirty":t' \
                  'rue}]'
  EXP_KIND_ALL = '[{"answer":"test kindness","exerciseId":"10cce190-354e-489' \
                 'b-a14c-1971673da8dd","id":"1cae3467-18ca-4830-8960-d6e3222' \
                 'ae714","type":"participantExerciseQuestionAnswers","isDirt' \
                 'y":true},{"answer":"test kindness","exerciseId":"10cce190-' \
                 '354e-489b-a14c-1971673da8dd","id":"9408c4f0-586d-4d1a-b77c' \
                 '-9445c0f74ab2","type":"participantExerciseQuestionAnswers"' \
                 ',"isDirty":true}]'
  EXP_KIND_1 = '[{"answer":"test kindness","exerciseId":"10cce190-354e-489b-' \
               'a14c-1971673da8dd","id":"1cae3467-18ca-4830-8960-d6e3222ae71' \
               '4","type":"participantExerciseQuestionAnswers","isDirty":true}]'
  SAVORING_ALL = '[{"answer":"test savoring","exerciseId":"6df7d11c-41c0-45e' \
                 'd-878d-42d370bd9486","id":"986f6307-5073-483f-b0de-ef1475e' \
                 '12f9a","type":"participantExerciseQuestionAnswers","isDirt' \
                 'y":true},{"answer":"test savoring","exerciseId":"6df7d11c-' \
                 '41c0-45ed-878d-42d370bd9486","id":"44536374-4cc2-416d-a595' \
                 '-721aa0ad5928","type":"participantExerciseQuestionAnswers"' \
                 ',"isDirty":true}]'
  SAVORING_1 = '[{"answer":"test savoring","exerciseId":"6df7d11c-41c0-45ed-' \
               '878d-42d370bd9486","id":"986f6307-5073-483f-b0de-ef1475e12f9' \
               'a","type":"participantExerciseQuestionAnswers","isDirty":true}]'
end

# Values for riskyTimes inserted into localStorage for various examples
module RiskyTimes
  KEY = 'riskyTimes'
  risky_time = DateTime.now + 1
  TIME_1 = [{ 'day' => 'Wednesday', 'time' => risky_time.iso8601(3),
              'description' => 'Test Risky Time',
              'id' => '645a5a78-29e1-411a-b18d-f94dbc5769cb',
              'notificationId' => 861_145_558, 'type' => 'riskyTimes',
              'isDirty' => true }].to_json
end

# Values for sessions inserted into localStorage for various examples
module Sessions
  KEY = 'sessions'
  date_1 = DateTime.now - 14
  date_2 = DateTime.now - 8
  SESSION_1 = [{ 'sessionDate' => DateTime.now.iso8601(3),
                 'id' => '98155902-f3c7-451a-851d-2f7ae6bbf2c9',
                 'sessionType' => 'session_1', 'type' => 'sessions',
                 'isDirty' => true }].to_json
  SESSION_2 = [{ 'sessionDate' => date_1.iso8601(3),
                 'id' => 'fa4e81fa-5706-40f2-990d-03d40e14ac62',
                 'sessionType' => 'session_1', 'type' => 'sessions',
                 'isDirty' => true },
               { 'sessionDate' => DateTime.now.iso8601(3),
                 'id' => '513c9756-06f7-4f75-8eef-caadecfb12a7',
                 'sessionType' => 'session_2', 'type' => 'sessions',
                 'isDirty' => true }].to_json
  SESSION_3 = [{ 'sessionDate' => date_1.iso8601(3),
                 'id' => '750af45c-accf-4187-b9d2-f79c778fd8e7',
                 'sessionType' => 'session_1', 'type' => 'sessions',
                 'isDirty' => true },
               { 'sessionDate' => date_2.iso8601(3),
                 'id' => '497995f7-baa3-4fe0-bb42-19c424b87d1e',
                 'sessionType' => 'session_2', 'type' => 'sessions',
                 'isDirty' => true },
               { 'sessionDate' => DateTime.now.iso8601(3),
                 'id' => '95a64771-1797-4bad-a8a6-003ea4bfd8ca',
                 'sessionType' => 'session_3', 'type' => 'sessions',
                 'isDirty' => true }].to_json
end

# Values for socialSupports inserted into localStorage for various examples
module SocialSupports
  KEY = 'socialSupports'
  SUPPORT_1 = [{ 'name' => 'Test Smith',
                 'reason' => 'He/she will offer encouragement along the way.',
                 'id' => 'd760c1a9-f8b0-49b6-9545-aa4e5606f734',
                 'type' => 'socialSupports', 'isDirty' => true }].to_json
end
