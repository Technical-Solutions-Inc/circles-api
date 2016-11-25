puts "\n"+"*"*50
puts "STARTING SEEDS"
puts "*"*50

# Constants
NUM_USERS         = 20
NUM_EVENTS        = 60
MIN_START_DATE    = 2.years.ago
MAX_END_DATE      = 1.year.from_now

MANDATORY_USERS = [
  {name: "Channing", email: "channing@tsi.com"},
  {name: "Bryan", email: "bryan@tsi.com"},
  {name: "Eileen", email: "eileen@tsi.com"}
]

MANDATORY_EVENTS = [
  {name: "Thanksgiving", start_date: "2016-11-28"},
  {name: "Boulder Visit", start_date: "2016-12-09", end_date: "2016-12-13"},
  {name: "Burning Man 2016", start_date: "2016-08-22", end_date: "2016-09-05"},
  {name: "Burning Man 2015", start_date: "2015-08-22", end_date: "2015-09-05"},
  {name: "Burning Man 2014", start_date: "2014-08-22", end_date: "2014-09-05"}
]

# Event Name Generator Fcns
NAME_FCNS = [
  -> { FFaker::Venue.name },
  -> { "#{FFaker::Music.artist} Concert" },
  -> { FFaker::Education.school },
  -> { FFaker::Conference.name }
]

# Create users:
puts "\n\tAdding Users"
USERS = 20.times.collect do
  {
    name: FFaker::Name.name,
    email: FFaker::Internet.email
  }
end

(MANDATORY_USERS + USERS).each do |user|
  puts "\n\t...Creating #{user}"
  User.create(user)
  puts "\t...Created #{user}\n"
end

# Create events and populate them with members
puts "\n\tAdding Events"
EVENTS_DATA = 60.times.collect do
  start_date = rand(MIN_START_DATE..MAX_END_DATE)

  {
    name: NAME_FCNS.sample.(),
    start_date: start_date,
    end_date: rand(start_date..MAX_END_DATE)
  }
end

(EVENTS_DATA + MANDATORY_EVENTS).each do |event|
  puts "\n\t...Creating #{event} and adding members"
  e = Event.create(event)
  e.add_members(members: User.order("RANDOM()").first(rand(1..User.count)))
  puts "\t...Created #{event}\n"
end

# admins = User.first(2)
# Event.all.each do |event|
#   event.add_members(members: admins)
# end

puts "\n"+"*"*50
puts "FINISHED SEEDS"
puts "*"*50+"\n"
