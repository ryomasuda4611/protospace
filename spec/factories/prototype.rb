FactoryGirl.define do
  factory :prototype do
  title  {Faker::Lorem.sentence}
  catch_copy {Faker::Lorem.sentence}
  concept {Faker::Lorem.paragraph}
  user
end
