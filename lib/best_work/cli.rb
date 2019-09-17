module BestWork
  class CLI
  attr_reader :places

    def run
        welcome
        menu

    end

    def welcome
      puts "Looking for an affordable spot to travel this Fall (Y/N)?"
      answer=gets.chomp
      if answer=="N"
        puts "Staycations are the best vacations!"
        exit
      elsif answer=="Y"
        places
      else
        puts "Im not sure what you mean by that. Try selecting (Y/N)."
      end
    end

    def places
      @places=Spots.all
    end

    def menu
      input=nil
      while input != "exit"
      puts "Enter the number of the destination you would like to learn more about or type list for the full list:"
      input=gets.chomp
        if input!="list" && input.to_i>0 && input.to_i<=20
          puts @places[(input.to_i)-1]
        elsif input=="list"
          places
        elsif input == "exit"
          puts ""
        else
          puts "Not sure what you mean, please pick a number off the list or type list to see all places."
          puts ""
        end
      end
      puts "Go book your trip!"
    end


  end
end
