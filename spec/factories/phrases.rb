# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :phrase do
    content "Oh no, eggys!"
    user
  end
end
