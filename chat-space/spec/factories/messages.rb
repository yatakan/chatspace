FactoryGirl.define do

  factory :message do
    text             { Faker::StarWars.wookie_sentence }
    image            Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/images/test.jpg'))
    group
    user
  end

end
