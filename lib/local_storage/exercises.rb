# Values for exercises inserted into localStorage for various examples
# These are currently not being used as they don't have the desired effect
module Exercises
  KEY = 'exercises'
  good_inst = [{ 'id': 1, 'instruction': 'describe the 1st good thing that h' \
                 'appened to you here' },
               { 'id': 2, 'instruction': 'describe the 2nd good thing that h' \
                 'appened to you here' },
               { 'id': 3, 'instruction': 'describe the 3rd good thing that h' \
                 'appened to you here' }]
  date_1 = DateTime.now - 4
  kind_inst = [{ 'id': 1, 'instruction': 'describe an act of kindness you di' \
                 'd today' },
               { 'id': 2, 'instruction': 'describe an act of kindness you sa' \
                 'w someone else do today' }]
  date_2 = DateTime.now - 3
  savor_inst = [{ 'id': 1, 'instruction': 'describe your 1st experience that' \
                  ' you savored here' },
                { 'id': 2, 'instruction': 'describe your 2nd experience that' \
                  ' you savored here' }]
  date_3 = DateTime.now - 2
  ALL = [{ 'exerciseDay' => date_1.iso8601(3), 'type' => 'exercises',
           'exerciseName' => 'Three Good Things', 'description' =>
           'Please describe three good things that happened to you today:',
           'instructions' => good_inst, 'id' =>
           '4fafa27b-2d31-4050-a951-a9b18d85078f', 'isDirty' => true },
         { 'exerciseDay' => date_2.iso8601(3), 'type' => 'exercises',
           'exerciseName' => 'Experiencing Kindness', 'description' => 
           'Please describe two acts of kindness: a kindness you did, and a ' \
           'kindness you saw someone else do today.:', 'instructions' =>
           kind_inst, 'id' => '10cce190-354e-489b-a14c-1971673da8dd',
           'isDirty' => true },
         { 'exerciseDay' => date_3.iso8601(3), 'type' => 'exercises',
           'exerciseName' => 'Savoring', 'description' => 
           'Please describe experiences that you savored in the past four ' \
           'hours:', 'instructions' => savor_inst, 'id' =>
           '6df7d11c-41c0-45ed-878d-42d370bd9486', 'isDirty' => true }].to_json
end
