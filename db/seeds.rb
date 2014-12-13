require 'faker'

# Create Contacts
50.times do
  Contact.create!(
    name:       Faker::Name.name,
    entity:     Faker::Company.name,
    phone:      Faker::PhoneNumber.phone_number,
    alt_phone:  Faker::PhoneNumber.phone_number,
    dead_phone: Faker::PhoneNumber.phone_number,
    email:      Faker::Internet.email,
    alt_email:  Faker::Internet.email,
    dead_email: Faker::Internet.email,
    body:       Faker::Lorem.paragraph
  )
end
