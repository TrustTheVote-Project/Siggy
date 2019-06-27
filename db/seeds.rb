# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Leo.delete_all
SignatureSubmission.delete_all
county = Faker::Address.county
Leo.create({
  email: "jane.bloom@elections.adamscounty.gov",
  password: "voteathome",
  county: county
})

Admin.create({
  email: "fiona.amber@siggy.trustthevote.org",
  password: "Tangerine Wardrobe Nineteen Forklift Hiker"
})

signatures = [
  Base64.strict_encode64(Rails.application.assets['signature1.jpg'].to_s),
  Base64.strict_encode64(Rails.application.assets['signature2.jpg'].to_s),
  Base64.strict_encode64(Rails.application.assets['signature3.jpg'].to_s)
]

def create_submission(status, county, signatures)
  dob = Faker::Date.between(104.years.ago, 18.years.ago)
  SignatureSubmission.create({
    first_name: Faker::Name.first_name ,
    last_name: Faker::Name.last_name ,
    middle_name: Faker::Name.middle_name ,
    suffix: rand > 0.9 ? Faker::Name.suffix : nil,
    address: Faker::Address.street_address ,
    city: Faker::Address.city ,
    state: Faker::Address.state_abbr ,
    zip: Faker::Address.zip ,
    county: county ,
    email: Faker::Internet.email ,
    phone: Faker::PhoneNumber.cell_phone,
    phone_type: SignatureSubmission::PhoneType.mobile,
    signature_image: "data:image/jpg;base64,#{signatures[rand(3)]}",
    status: status,
    id_number: Faker::IDNumber.invalid,
    dob_month: dob.month,
    dob_year: dob.year,
    dob_day: dob.day
  })
end

392.times do
  create_submission(SignatureSubmission::Status.accepted, county, signatures)
end
4.times do
  create_submission(SignatureSubmission::Status.rejected, county, signatures)
end
6.times do
  create_submission(SignatureSubmission::Status.pending, county, signatures)
end
