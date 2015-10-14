module RiskyTimes
  KEY = 'riskyTimes'
  risky_time = DateTime.now + 1
  TIME_1 = [{ 'day' => 'Wednesday', 'time' => risky_time.iso8601(3), 'description' => 'Test Risky Time', 'id' => '645a5a78-29e1-411a-b18d-f94dbc5769cb', 'notificationId' => 861_145_558, 'type' => 'riskyTimes', 'isDirty' => true }].to_json
end
