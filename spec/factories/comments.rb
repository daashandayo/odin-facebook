FactoryBot.define do
  factory :comment do
      content { "Dummy comment here" }
      association :user, factory: :user
      association :post, factory: :post
  end  
end
