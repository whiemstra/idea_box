FactoryGirl.define do
  factory :idea do
    description 'this is a description'
    association :category
  end
end
