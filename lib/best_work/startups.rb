module BestWork
  class Startups
    attr_accessor :name, :business_type, :description, :founded, :location
    @@all=[]

    def initialize (name=nil,business_type=nil,description=nil,founded=nil,location=nil)
      @name=name
      @business_type=business_type
      @description=description
      @founded=founded
      @location=location
      @@all<<self
    end

    def self.create_from_scraper (path)
      self.new(
      path.css("h2 a").text
      path.css("div.field-about-us div.item").text.strip
      path.css("div.field-type").text.strip
      path.css("time.datetime").text
      path.css("div.field.field-location  div.item").text
      )
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
