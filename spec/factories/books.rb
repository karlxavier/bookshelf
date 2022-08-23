FactoryBot.define do
  factory(:book) do
    title { Faker::Book.title }
    description { Faker::Lorem.paragraph }
    author { Faker::Name.name }
  end
end