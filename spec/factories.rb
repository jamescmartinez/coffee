FactoryBot.define do
  factory :event do
    start_at { Time.current }
    end_at { Time.current }
    name { "The Mill" }
    host  { create(:user) }

    trait :with_group do
      group
    end

    trait :with_online_event do
      is_online { true }
      online_event_url { "https://meet.google.com/coffeecoffeecoffeecoffee" }
    end

    trait :with_foursquare_venue do
      foursquare_venue_id { "4feddd79d86cd6f22dc171a9" }
      foursquare_venue_data do
        # This data is copied from the VCR cassette :foursquare_venue_details
        # It only copies the data we use. There's tons of other data in there.
        {
          id: "4feddd79d86cd6f22dc171a9",
          name: "The Mill",
          location: {
            formattedAddress: ["736 Divisadero St (btwn Grove St & Fulton St)", "San Francisco, CA 94117", "United States"],
            lat: 37.77632881728594,
            lng: -122.43802428245543
          },
          canonicalUrl: "https://foursquare.com/v/the-mill/4feddd79d86cd6f22dc171a9",
          bestPhoto: {
            prefix: "https://igx.4sqi.net/img/general/",
            suffix: "/403777_tR60tUZMVoJ5Q5ylr8hQnp0pgZTy5BOQLqydzAoHWiA.jpg",
            width: 612,
            height: 612
          }
        }
      end
    end

    trait :with_image do
      image { Rack::Test::UploadedFile.new(Rails.root.join("spec/support/assets/image.png"), "image/png") }
    end

    factory :future_event do
      start_at { Time.current.tomorrow }
      end_at { Time.current.tomorrow.tomorrow }
    end

    factory :really_future_event do
      start_at { Time.current.tomorrow.tomorrow }
      end_at { Time.current.tomorrow.tomorrow.tomorrow }
    end

    factory :now_event do
      start_at { Time.current.yesterday }
      end_at { Time.current.tomorrow }
    end

    factory :past_event do
      start_at { Time.current.yesterday.yesterday }
      end_at { Time.current.yesterday }
    end

    factory :inactive_event do
      start_at { 32.days.ago }
      end_at { 31.days.ago }
    end
  end

  factory :group do
    name { "SF iOS Coffee" }
    time_zone { "America/Los_Angeles" }

    trait :with_image do
      image { Rack::Test::UploadedFile.new(Rails.root.join("spec/support/assets/image.png"), "image/png") }
    end
  end

  factory :membership do
    user
    group
  end

  factory :user do
    name { "Some Human" }
    sequence(:email) { |n| "email-#{n}@example.com" }
    twitter { "twitter" }
  end
end
