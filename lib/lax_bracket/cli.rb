
#Our CLI Controller

class LaxBracket::CLI

  def call
    list_pre_rank
  #  list_brackets
    menu
    goodbye
  end

  def list_pre_rank
    puts "Prior to playoffs, the rankings were:"
    @pre_ranks = LaxBracket::OriginalRank.all

    @pre_ranks.each do |team|
      puts "#{team.rank}. #{team.name}"
    end
  end

  def list_brackets
    puts "Lacrosse Bracket includes:"
    @brackets = LaxBracket::Brackets.all
    @brackets.each do |bracket|
      puts "#{bracket.name}:"
      bracket.teams.each.with_index(1) do |team, i|
        puts "#{i}. #{team}"
      end
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the team you would like more info on or type 'brackets', 'results', 'pre rankings' or 'exit':"
      input = gets.strip.downcase

      if input.to_i > 0
        the_bracket = @brackets[input.to_i-1]
        puts "#{the_bracket.name}:"
        the_bracket.teams.each.with_index(1) do |team, i|
          puts "#{i}. #{team}"
        end
      elsif input == "brackets"
        list_brackets
      elsif input == "pre rankings"
        list_pre_rank
      elsif input == "results"
        list_results
      elsif input == "exit"
      else
        puts "Not sure what you want, type 'brackets', 'results', or 'exit'."
      end
    end
  end

  def follow_team
    puts "now you are following a team"
  end

  def list_results
    puts "here are the results"
  end

  def goodbye
    puts "type './bin/lax-bracket' to run the program again."
  end
end
