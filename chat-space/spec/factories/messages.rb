FactoryGirl.define do

  factory :message do
    text             { Faker::StarWars.wookie_sentence }
    image            Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/images/test.jpg'))
    group
    user
  end

  factory :user do
    name                    { Faker::Pokemon.name }
    email                   { Faker::Internet.email }
    password                "00000000"
    password_confirmation   "00000000"
  end

  factory :group do
    name                    { Faker::Pokemon.name }
  end
end
