FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@example.com"}

  factory :user do
    #built_users   = build_list(:user, 5)
    #created_users = create_list(:user, 5)
    first_name "Art"
    last_name "Langley"
    password "numbers123"
    email
    admin "false"
  end

  factory :admin, class: User do
    email 
    password "hellothere"
    admin true
    first_name "Admin"
    last_name "User"
  end

end