module BestWork
  class Startups
    attr_accessor :name, :description, :plane_ticket, :hotel_rate
    @@all=[]

    def initialize
    end

    def self.all
      puts "[maine, RI, texas, cali]"

      trip_1=Spots.new
      trip_1.name="vk1"
      trip_1.description="its so cool"
      trip_1.plane_ticket="$250"
      trip_1.hotel_rate="$100"

      trip_2=Spots.new
      trip_2.name="vk2"
      trip_2.description="not that cool"
      trip_2.plane_ticket="$10"
      trip_2.hotel_rate="$10"
      #return all the spots in a numbered order
      [trip_1,trip_2]
    end

  end
end
