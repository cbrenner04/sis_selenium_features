# frozen_string_literal: true
# Values for cessationReasons inserted into localStorage for various examples
module CessationReasons
  KEY = 'cessationReasons'

  REASON_1 = [{ 'description' => 'Test Reason 1',
                'id' => '517d4c2f-da8c-45ae-9e8e-1359a0c19dd3',
                'type' => 'cessationReasons',
                'isDirty' => true }].to_json
end
