FactoryBot.define do
  factory :user, class: Api::V1::User do
    name { Faker::Games::HeroesOfTheStorm.hero }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
