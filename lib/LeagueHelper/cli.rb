

class LeagueHelper::CLI
  attr_accessor :summoner
  def call
    puts "Welcome to League Helper"
    puts "Please enter your summoner name"
    input = gets.chomp
    @summoner = Summoner.new(input)
    LolScraper.scrape_summoner_page(@summoner)
    LolScraper.summ_champ_stats(@summoner)
    @summoner.stats
    puts ""
    if @summoner.rank != "Unranked"
      options
    else
      puts "Goodbye"
    end
  end

  def options(input = '')
    while input != 'exit'
      puts "Enter the number for the area of game play you would like to improve"
      puts  "1.Rank Solo Q       3.Most played"
      puts  "2.Champion Build    4.New summoner lookup"
      puts ""
      input = gets.chomp.downcase
      action(input)
    end
    puts "Goodbye"
  end

  def action(input)
      case input
      when '1'
        soloQ
        puts "Enter the number of what you would like to do next"
        puts "Enter 'exit' to quit"
        puts ""
      when '2'
        champ_mastery
        puts ""
      when '3'
        puts "checkout these streamers"
      when 'exit'
        puts "Thank You"
      else
        puts "I dont understand that choice"
      end
  end

  def soloQ
    puts "Here is a list of your best champions with win percent for each"
    c=@summoner.best_champs
    puts "#{c[0].name} #{c[0].my_winpercent}"
    puts "#{c[1].name} #{c[1].my_winpercent}"
    puts "I suggest focusing on these two to climb in Rank"
    puts ""
  end

  def champ_mastery
    summoner.champ_builds
    summoner.champions.each {|champ| puts champ.name}
    puts "Which champions would you like a build for?"
    puts ""
    input= gets.chomp
    champ = summoner.champ_find(input)
    if champ
      puts "Here are the most popular items"
      puts ""
      champ.build.each_with_index {|item, idx| puts "#{idx+1}. #{item}"}
    else
      puts "That champion is not in your champ pool"
      puts ""
    end
  end

end
