FactoryGirl.define do
  factory :user do
    #built_users   = build_list(:user, 5)
    #created_users = create_list(:user, 5)

    first_name "Art"
    last_name "Langley"
    email "art@example.com"
    password "numbers123"
    admin "false"
  end

  

  factory :product do
    name ""
    description ""
    color ""
    price ""
    image_url ""
  end

  factory :comment do
  end
end