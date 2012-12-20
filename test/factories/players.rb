# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :player do
    first_name "MyString"
    last_name "MyString"
    born_at "2012-12-20 11:18:17"
    sex false
    position "MyString"
    number 1
    acceleration 1
    stamina 1
    aggression 1
    marking 1
    balance 1
  end
end
