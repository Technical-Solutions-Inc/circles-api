FactoryGirl.define do
  factory :event do
    name FFaker::Venue.name
    start_date FFaker::Time.date
    # The FFaker gem is broken right now: https://github.com/ffaker/ffaker/issues/305
    # Once it's fixed we can use the between method to have this date always be after the start_date
    end_date FFaker::Time.date
  end
end