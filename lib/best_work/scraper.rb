module BestWork
  class Scraper

    def get_file
      Nokogiri::HTML(open("https://www.builtinnyc.com/companies/best-places-to-work-nyc"))
    end

    def scrape_companies
      self.get_file.css("div.company--best-place").each  do |company|
        BestWork::Startups.create_from_scraper(company)
      end
    end

  end
end
