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

    trait(:fake_candidates) do
      after(:build) do |santa|
        3.times do |n|
          santa.candidates.build(uid: n)
        end
      end
    end

    factory :hermione do
      # defaults
    end

    factory :harry do
      user do
        create(
          :user,
          name: 'Harry Potter',
          screen_name: 'boywholived',
          uid: '666',
          email: 'harry@hogwarts.edu'
        )
      end
    end

    factory :ron do
      user do
        create(
          :user,
          name: 'Ron Weasley',
          screen_name: 'ginger_ninja',
          uid: '420',
          email: 'ron@hogwarts.edu'
        )
      end
    end

    factory :draco do
      user do
        create(
          :user,
          name: 'Draco Malfoy',
          screen_name: 'dragon_boy',
          uid: '696969',
          email: 'draco@hogwarts.edu'
        )
      end
    end

    factory :neville do
      user do
        create(
          :user,
          name: 'Neville Longbottom',
          screen_name: 'neville_up',
          uid: '0',
          email: 'neville@hogwarts.edu'
        )
      end
    end
  end
end
