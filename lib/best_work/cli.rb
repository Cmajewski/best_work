module BestWork
  class CLI
  attr_reader :company_list

    def run
        BestWork::Scraper.new.scrape_companies
        welcome
        menu

    end

    def welcome
      puts "Looking for a tech job in NY? (Yes/No)"
      answer=gets.chomp.upcase
      if answer=="NO"
        puts "Okay have a great day!"
        exit
      elsif answer=="YES"
        company_list
      else
        puts "Im not sure what you mean by that. Try selecting (Yes/No)."
      end
    end

    # def companies
    #   @companies=BestWork::Startups.all
    # end

    def company_list
      BestWork::Startups.all.each_with_index do |item,index|
        puts "#{index+1}. #{item.name}"
        puts "  Field: #{item.business_type}"
        puts "  Founded: #{item.founded}"
        puts "  Location: #{item.location}"
        puts "  Description: #{item.description}"
        puts "______________________"
      end
    end

    def company_selected (input)


    end

    def menu
      input=nil
      while input != "exit"
      puts "Enter the number of the destination you would like to learn more about or type list for the full list:"
      input=gets.chomp
        if input!="list" && input.to_i>0 && input.to_i<=Startups.all.count
          puts Startups.find (input.to_i-1)
        elsif input=="list"
          company_list
        elsif input == "exit"
          puts ""
        else
          puts "Not sure what you mean, please pick a number off the list or type list to see all places."
          puts ""
        end
      end
      puts "Go get your dream job!"
    end


  end
end
