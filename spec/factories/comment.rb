FactoryGirl.define do
  factory :comment do
    prototype
    user
    review { Faker::Lorem.paragraph }
  end
end
