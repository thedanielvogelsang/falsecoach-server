FactoryBot.define do
  factory :workout do
    client
    title { Faker::Lorem.words(3).join(' ') }
  end
end
