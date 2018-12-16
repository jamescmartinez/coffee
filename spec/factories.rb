FactoryBot.define do
  factory :event do
    start_at { Time.current }
    end_at { Time.current }
    location { 'The Mill' }
    group
    venue

    factory :future_event do
      start_at { Time.current.tomorrow }
      end_at { Time.current.tomorrow.tomorrow }
    end

    factory :now_event do
      start_at { Time.current.yesterday }
      end_at { Time.current.tomorrow }
    end

    factory :past_event do
      start_at { Time.current.yesterday.yesterday }
      end_at { Time.current.yesterday }
    end
  end

  factory :group do
    name { 'SF iOS Coffee' }
    time_zone { 'America/Los_Angeles' }
  end

  factory :membership do
    user
    group
  end

  factory :user do
    name { 'Some Human' }
    email { 'example@example.com' }
    twitter { 'twitter' }
    admin { false }
  end

  factory :venue do
    sequence(:foursquare_id) { |n| "4feddd79d86cd6f22dc171a9#{n}" }
    foursquare_url { 'https://foursquare.com/v/the-mill/4feddd79d86cd6f22dc171a9' }
    name { 'The Mill' }
    image_url { 'https://igx.4sqi.net/img/general/612x612/403777_tR60tUZMVoJ5Q5ylr8hQnp0pgZTy5BOQLqydzAoHWiA.jpg' }

    factory :unhydrated_venue do
      foursquare_url { nil }
      name { nil }
      image_url { nil }
    end
  end
end
