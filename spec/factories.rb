FactoryBot.define do
  factory :user do
    name 'Hermione Granger'
    screen_name 'hermione'
    uid '1234567890'
    avatar 'http://via.placeholder.com/48x48'
    email 'hermione@hogwarts.edu'
  end

  factory :christmas do
    signup_deadline Time.zone.local(2017, 11, 26)
  end

  factory :santa do
    christmas
    user
  end
end
