module CessationDate
  KEY = 'cessationDate'
  date_1 = DateTime.now + 4
  date_2 = DateTime.now - 8
  date_3 = DateTime.now - 7
  DATE_1 = [{ 'cessationDay' => date_1.iso8601(3), 'id' => '12b8b230-0b4d-4a0b-b1ab-d3f7b55d029c', 'type' => 'cessationDate', 'isDirty' => true }].to_json
  DATE_2 = [{ 'cessationDay' => DateTime.now.iso8601(3), 'id' => 'dede6ca2-00f2-41cf-a61e-f066c55e25d4', 'type' => 'cessationDate', 'isDirty' => true }].to_json
  DATE_3 = [{ 'cessationDay' => date_2.iso8601(3), 'id' => '3f784af9-3745-4e89-a27a-ae6229c1b34b', 'type' => 'cessationDate', 'isDirty' => true }].to_json
  DATE_4 = [{ 'cessationDay' => date_3.iso8601(3), 'id' => 'adsfwef9-3745-4e89-a27a-eg6asdf1b34b', 'type' => 'cessationDate', 'isDirty' => true }].to_json
end
