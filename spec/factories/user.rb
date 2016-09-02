FactoryGirl.define do
  factory :user  do
    password = Faker::Internet.password(8)
    email {Faker::Internet.email}
    username {Faker::Internet.user_name}
    password password
    password_confirmation password
  end
end
