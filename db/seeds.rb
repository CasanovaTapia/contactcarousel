require 'faker'
# Dial
Dial.create!(result: "No answer")
Dial.create!(result: "Disconnected")
Dial.create!(result: "Busy")
Dial.create!(result: "Wrong number")
Dial.create!(result: "Good")
dials = Dial.all

# Conversation
Conversation.create!(result: "Left message")
Conversation.create!(result: "Talk")
Conversation.create!(result: "Do not call")
conversations = Conversation.all

# Investing
Investing.create!(result: "Hold")
Investing.create!(result: "Buy")
Investing.create!(result: "Exchange")
Investing.create!(result: "Sell")
investings = Investing.all

# Timing
Timing.create!(result: "Vague")
Timing.create!(result: "Soon")
Timing.create!(result: "Now")
timings = Timing.all

# Motivator
Motivator.create!(result: "Money")
Motivator.create!(result: "Opportunity")
Motivator.create!(result: "Change")
Motivator.create!(result: "Pain")
motivators = Motivator.all

# Create Contacts
50.times do
  Contact.create!(
    name:               Faker::Name.name,
    entity:             Faker::Company.name,
    phone:              Faker::PhoneNumber.phone_number,
    alt_phone:          Faker::PhoneNumber.phone_number,
    dead_phone:         Faker::PhoneNumber.phone_number,
    email:              Faker::Internet.email,
    alt_email:          Faker::Internet.email,
    dead_email:         Faker::Internet.email,
    body:               Faker::Lorem.paragraph,
    dial_id:            dials.sample.id,
    conversation_id:    conversations.sample.id,
    investing_id:       investings.sample.id,
    timing_id:          timings.sample.id,
    motivator_id:       motivators.sample.id,
  )
end
