FactoryGirl.define do

  factory :message do
    text             { Faker::StarWars.wookie_sentence }
    user_id          "1"
    group_id         "1"
    image            Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/images/test.jpg'))
  end

end
