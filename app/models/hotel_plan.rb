class HotelPlan < ApplicationRecord
  validates :plan_name, presence: true
  validates :room_name, presence: true, uniqueness: { scope: :plan_name }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.fetch_hotel_plan
    url = 'http://asp.hotel-story.ne.jp/ver3d/ASPP0200.asp?hidSELECTCOD1=00020&hidSELECTCOD2=001&hidSELECTPLAN=A4LXD&pac=R/C&hidSELECTARRYMD=2020/07/08&hidSELECTHAKSU=1&rooms=1&selectptyp=&hidk=&reffrom=&LB01=server6'
    agent = Mechanize.new
    page = agent.get(url)
    page.links.each do |link|
      puts link.text
    end
  end
end
