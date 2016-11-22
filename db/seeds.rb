puts "\n"+"*"*50
puts "STARTING SEEDS"
puts "*"*50

# Create users:
puts "\n\tAdding Users"
USERS = [
  {name: "Channing", email: "channing@tsi.com"},
  {name: "Bryan", email: "bryan@tsi.com"},
  {name: "Eileen", email: "eileen@tsi.com"}
]
USERS.each do |user|
  puts "\n\t...Creating #{user}"
  User.create(user)
  puts "\t...Created #{user}\n"
end

# Create events and populate them with members
puts "\n\tAdding Events"
EVENTS = [
  {name: "Thanksgiving", start_date: "2016-11-28"},
  {name: "Boulder Visit", start_date: "2016-12-09", end_date: "2016-12-13"},
  {name: "Burning Man 2016", start_date: "2016-08-22", end_date: "2016-09-05"},
  {name: "Burning Man 2015", start_date: "2015-08-22", end_date: "2015-09-05"},
  {name: "Burning Man 2014", start_date: "2014-08-22", end_date: "2014-09-05"}
]
EVENTS.each do |event|
  puts "\n\t...Creating #{event} and adding members"
  e = Event.create(event)
  e.add_members(members: User.all)
  puts "\t...Created #{event}\n"
end

puts "\n"+"*"*50
puts "FINISHED SEEDS"
puts "*"*50+"\n"