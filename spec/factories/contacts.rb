FactoryBot.define do
  factory :contact do
    first_name { "MyString" }
    last_name { "MyString" }
    patient { nil }
  end
end
