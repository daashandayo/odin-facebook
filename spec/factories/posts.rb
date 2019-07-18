FactoryBot.define do
  factory :post do
      content { "Some placeholder content" }
      association :user, factory: :user
  end  
end
