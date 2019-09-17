module BestWork
  class CLI
  attr_reader :all_companies

    def run
      Scraper.new.scrape_companies
      start
      menu
    end

    def start
      puts "Looking for a tech job in NY? (Yes/No)"
      answer=gets.chomp.upcase
      if answer=="NO"
        puts "Okay have a great day!"
        exit
      elsif answer=="YES"
      else
        puts "Im not sure what you mean by that. Try selecting (Yes/No)."
      end
    end

    def menu
      puts "Want us to find a company for you or do you want to browse the list yourself? (Find/list)"
      input_2=gets.chomp.downcase
        if input_2=="find"
          company(self.random)
        elsif input_2=="list"
          all_companies
        else
        puts "Please select find or list."
        menu
      end
    end

    def random
      Startups.find(rand(1..101))
    end

      def company(item)
        puts ""
        puts item.name.colorize(:blue)
        puts "Field: #{item.business_type}"
        puts "Founded: #{item.founded}"
        puts "Location: #{item.location}"
        puts "______________________"
        puts ""
        puts "Would you like to learn more about this company? (Yes/No)"
        input_3=gets.chomp.downcase
        if input_3=="yes"
        more_description(item)
        end
      end

      def more_description(item)
        puts ""
        puts item.name.colorize(:navy)
        puts "More about this company:".colorize(:blue)
        puts item.description
        puts ""
        menu
      end


    #   case input
    #     while @input_2=="find"
    #       random=Startups.find(rand(1..101))
    #       company(random)
    #       puts "Want to know more about this company? (Yes/No)"
    #       input_3=gets.chomp.downcase
    #       if input_3=="yes"
    #         more_description(random)
    #       else
    #       when @input_2=='list'
    #         all_companies
    #       else
    #         puts "Im not sure what you mean by that. Try selecting (Yes/No)."
    #     end
    #   end
    # end

    # def menu
    #   input=nil
    #   while input != "exit"
    #   puts "Enter the number of the company you would like to learn more about,type list for the full list or type exit to leave:".colorize(:blue)
    #   input=gets.chomp
    #     if input!="list" && input.to_i>0 && input.to_i<=Startups.all.count
    #         details=Startups.find (input.to_i)
    #        more_description(details)
    #     elsif input=="list"
    #       all_companies
    #     elsif input == "exit"
    #       puts ""
    #     else
    #       puts "Not sure what you mean, please pick a number off the list or type list to see all places.".
    #       puts ""
    #       puts "______________________"
    #     end
    #   end
    #   puts "Go get your dream job!"
    # end

    def all_companies
      Startups.all.each_with_index do |item,index|
        puts ""
        puts "#{index+1}. #{item.name}".colorize(:blue)
        puts "   Field: #{item.business_type}"
        puts "   Founded: #{item.founded}"
        puts "   Location: #{item.location}"
        #puts "   Description: #{item.description}"
        puts "______________________"
      end
      after_list
    end

    def after_list
      puts "Enter the number of the company you would like to learn more about or type exit to leave:".colorize(:blue)
      input=gets.chomp
        if input.to_i>0 && input.to_i<=Startups.all.count
          details=Startups.find (input.to_i)
          more_description(details)
        elsif input == "exit"
          puts ""Go get your dream job!""
          exit
        else
          puts "Not sure what you mean, please pick a number off the list or type list to see all places.".
          puts ""
          puts "______________________"
        end
      end
    end


  end
end
