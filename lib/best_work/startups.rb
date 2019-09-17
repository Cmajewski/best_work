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
      path.css("h2 a").text,
      path.css("div.field-about-us div.item").text.strip,
      path.css("div.field-type").text.strip,
      path.css("time.datetime").text,
      path.css("div.field.field-location  div.item").text,
      )
    end

    def self.all
      @@all
    end

    def self.find(input)
      @@all[input-1]
    end

    def self.print_all_with_index
      @@all.select do |company,index|
        puts "#{index}. company"
      end
    end

    def self.random
      @@all.sample
    end

    def self.count
      @@all.count
    end

  end
end
