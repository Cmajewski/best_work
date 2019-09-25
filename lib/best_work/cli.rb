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
      puts ""
      puts "Want us to find a company for you or do you want to browse the list yourself? (Find/list)".colorize(:blue)
      input=gets.chomp.downcase
        if input=="find"
          company(self.random)
        elsif input=="list"
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
        input=gets.chomp.downcase
        if input=="yes"
        more_description(item)
        else
        menu
        end
      end

      def more_description(item)
        puts ""
        puts item.name.colorize(:blue)
        puts "More about this company:"
        puts item.description
        puts ""
        menu
      end

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
      puts "Do you want to see the list sorted? (Yes/No)"
      input=gets.chomp.downcase
      if input="yes"
      sorted_list
      else
      after_list
      end
    end

    def after_list
      puts "Enter the number of the company you would like to learn more about or type exit to leave:".colorize(:blue)
      input=gets.chomp
        if input.to_i>0 && input.to_i<=Startups.all.count
          details=Startups.find (input.to_i)
          more_description(details)
        elsif input.downcase == "exit"
          puts "Go get your dream job!"
          exit
        else
          puts "Not sure what you mean, please pick sort, exit or list to continue.".
          puts ""
          puts "______________________"
        end
    end

    def sorted_list
      Startups.print_with_sort.each_with_index do |item,index|
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


  end
end
