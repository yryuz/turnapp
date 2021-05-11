FactoryBot.define do
  factory :user do
    nickname              {"tarou"}
    email                 {"sample@sample.com"}
    password              {"aaa000"}
    password_confirmation    {password}
    year                  {20}
    introduction          {"text"}

  end
end