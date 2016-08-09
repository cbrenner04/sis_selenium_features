# frozen_string_literal: true

# Values for localSession inserted into localStorage for various examples
module LocalSession
  KEY = 'localSession'

  CIG_1 = [{ 'number_of_cigarettes_per_day' => '1',
             'isDirty' => true }].to_json

  CIG_MIL = [{ 'number_of_cigarettes_per_day' => '1000000',
               'isDirty' => true }].to_json
end
