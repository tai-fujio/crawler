require 'test_helper'
require 'vcr'

class HotelPlanTest < ActiveSupport::TestCase
  test ".fetch_hotel_plan" do
    VCR.use_cassette('fetch_hotel') do
      HotelPlan.fetch_hotel_plan
    end
  end
end
