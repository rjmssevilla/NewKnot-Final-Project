FactoryBot.define do
  factory :buyer_service do
    association :buyer
    association :service
  end
end
