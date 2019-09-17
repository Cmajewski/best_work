module BestWork
  class Scraper

    def get_file
      Nokogiri::HTML(open("https://www.builtinnyc.com/companies/best-places-to-work-nyc"))
    end

    def scrape_companies

      self.get_file.css("div.company--best-place").each  do |company|

        company.css("h2 a").text
        company.css("div.field-about-us div.item").text.strip
        company.css("div.field-type").text.strip
        company.css("time.datetime").text
        company.css("div.field.field-location  div.item").text
      end
      binding.pry
    end




  end
end
