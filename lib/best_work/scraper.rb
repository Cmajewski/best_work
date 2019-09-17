module BestWork
  class Scraper

    def get_file
      Nokogiri::HTML(open("https://www.builtinnyc.com/companies/best-places-to-work-nyc"))
    end

    def scrape_name
      x=[]
      y=[]
      type=[]
      a=[]
      b=[]
      self.get_file.css("div.company--best-place").each  do |company|
        x<<company.css("h2 a").text
        y<<company.css("div.field-about-us div.item").text.strip
        type<<company.css("div.field-type").text.strip
        a<<company.css("time.datetime").text
        b<<company.css("div.field.field-location  div.item").text
      end
      binding.pry
    end




  end
end
