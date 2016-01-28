# Values for riskyTimes inserted into localStorage for various examples
module RiskyTimes
  KEY = 'riskyTimes'
  risky_time_1 = DateTime.now + 1
  risky_time_2 = DateTime.now + 2
  TIMES = [{ 'time' => risky_time_1.iso8601(3),
              'description' => 'Test Risky Time',
              'strategy' => 'positive emotions',
              'id' => '645a5a78-29e1-411a-b18d-f94dbc5769cb',
              'notificationId' => 861_145_558, 'type' => 'riskyTimes',
              'isDirty' => true },
           { 'time' => risky_time_2.iso8601(3),
              'description' => 'Editable Risky Time',
              'strategy' => 'positive emotions',
              'id' => '645a5a78-29e1-411a-b18d-f94dbc5769cb',
              'notificationId' => 861_145_558, 'type' => 'riskyTimes',
              'isDirty' => true }].to_json
end
