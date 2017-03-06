

class LeagueHelper::CLI
  attr_accessor :summoner, :input
  def call
    puts "Welcome to League Helper"
    new_summoner
  end

  def options
    while @input != 'exit'
      puts ""
      puts "Please enter the number for the area of game play you would like to improve"
      puts "Or enter 'exit' to quit"
      puts  "1.Rank Solo Q       3.Most played Champs"
      puts  "2.Champion Build    4.New summoner lookup"
      puts ""
      @input = gets.chomp.downcase
      action
    end
  end

  def action
      case @input
      when '1'
        soloQ
        puts ""
      when '2'
        champ_mastery
        puts ""
      when '3'
        puts "Here are your most played champs"
        puts ""
        @summoner.my_champs
      when '4'
        new_summoner
      when 'exit'
        puts "Thank You"
        puts "Goodbye"
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
  end

  def champ_mastery
    puts "Which champions would you like a build for?"
    summoner.champ_builds
    summoner.champions.each {|champ| puts champ.name}
    puts ""
    @input= gets.chomp
    champ = summoner.champ_find(@input)
    if champ
      puts "Here are the most popular items"
      puts ""
      champ.build.each_with_index {|item, idx| puts "#{idx+1}. #{item}"}
    else
      puts "That champion is not in your champ pool"
    end
  end

  def new_summoner
    puts "Please enter your summoner name"
    @input = gets.chomp
    @summoner = Summoner.new(@input)
    LolScraper.scrape_summoner_page(@summoner)
    LolScraper.summ_champ_stats(@summoner)
    puts ""
    if @summoner.champions.count != 0
      @summoner.stats
      options
    else
      puts "Please try again when you are ranked"
      puts "Goodbye"
    end
  end



end
