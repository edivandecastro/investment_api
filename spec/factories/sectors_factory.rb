FactoryBot.define do
  factory :sector, class: Api::V1::Sector do
    name { Faker::Commerce.brand }
  end
end
