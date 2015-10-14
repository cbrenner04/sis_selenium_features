module Sessions
  KEY = 'sessions'
  date_1 = DateTime.now - 14
  date_2 = DateTime.now - 8
  SESSION_1 = [{ 'sessionDate' => DateTime.now.iso8601(3), 'id' => '98155902-f3c7-451a-851d-2f7ae6bbf2c9', 'sessionType' => 'session_1', 'type' => 'sessions', 'isDirty' => true }].to_json
  SESSION_2 = [{ 'sessionDate' => date_1.iso8601(3), 'id' => 'fa4e81fa-5706-40f2-990d-03d40e14ac62', 'sessionType' => 'session_1', 'type' => 'sessions', 'isDirty' => true },
               { 'sessionDate' => DateTime.now.iso8601(3), 'id' => '513c9756-06f7-4f75-8eef-caadecfb12a7', 'sessionType' => 'session_2', 'type' => 'sessions', 'isDirty' => true }].to_json
  SESSION_3 = [{ 'sessionDate' => date_1.iso8601(3), 'id' => '750af45c-accf-4187-b9d2-f79c778fd8e7', 'sessionType' => 'session_1', 'type' => 'sessions', 'isDirty' => true },
               { 'sessionDate' => date_2.iso8601(3), 'id' => '497995f7-baa3-4fe0-bb42-19c424b87d1e', 'sessionType' => 'session_2', 'type' => 'sessions', 'isDirty' => true },
               { 'sessionDate' => DateTime.now.iso8601(3), 'id' => '95a64771-1797-4bad-a8a6-003ea4bfd8ca', 'sessionType' => 'session_3', 'type' => 'sessions', 'isDirty' => true }].to_json
end
