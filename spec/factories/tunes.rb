FactoryBot.define do
  factory :tune do
    name    {"テスト"}
    url     {"test/test"}
    artist  {"test"}
    genre_id {2}
    text  {"text"}

    association :user 
  
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
    
  end
end
