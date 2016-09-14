FactoryGirl.define do
  factory :prototype do
  title  { Faker::Lorem.sentence }
  catch_copy { Faker::Lorem.sentence }
  concept { Faker::Lorem.paragraph }
  user
  created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end
end
