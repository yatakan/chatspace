FactoryGirl.define do

  factory :user do
    name                    { Faker::Pokemon.name }
    email                   { Faker::Internet.email }
    password                { Faker::Internet.password(8) }
    password_confirmation   { password }
  end

end
