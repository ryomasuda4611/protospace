include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :prototypeImage do
    image { fixture_file_upload("spec/fixtures/image/test.jpg") }
    trait :main do
      status :main
    end

    trait :sub do
      status :sub
    end
    prototype
  end
end
