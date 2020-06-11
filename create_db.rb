require_relative 'db'

puts 'Running one-time DB creation...'

DB.create_table :test_entry do
  primary_key :id
  String :test_string
end

DB.create_table :hits do
  primary_key :id
  DateTime :created_at
  String :url
  String :ip # convert to country later
  String :user_agent # convert to device later
  # String :country
  # String :device
end


puts 'Done.'
