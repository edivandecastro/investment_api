FactoryBot.define do
  factory :segment, class: Api::V1::Segment do
    name { Faker::Commerce.brand }
  end
end
