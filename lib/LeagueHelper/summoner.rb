class Summoner
  attr_accessor :name, :url_name, :champions, :rank, :lp, :win_ratio
  @@all = []
  def initialize(summoner_name)
    @name = summoner_name
    @url_name = @name.split(" ").join("+")
    @champions = []
  end

  def self.all
    @@all
  end

  def my_winpercent
    Scraper.new.champion_win(@champions)
  end

  def stats
    puts "Summoner: #{@name}"
    puts "Rank: #{@rank} with #{@lp}"
  end

  def my_champs
    @champions.each {|champ| puts "#{champ.name}"}
  end

  def best_champs
    @champions.sort {|a, b| b.my_winpercent <=> a.my_winpercent}
  end

  def champ_builds
    LolScraper.champion_build(@champions)
    @champions.each {|champ| champ.build.delete_at(6) }
    @champions
  end

  def champ_find(name)
    @champions.detect{|champ| champ.name.downcase == "#{name.downcase}"}
  end

end
