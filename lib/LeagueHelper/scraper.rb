require 'open-uri'
require 'pry'
require 'nokogiri'

class LolScraper
  SUMMONER_LOOKUP = "https://na.op.gg/summoner/userName="
  CHAMP_LOOKUP  = "http://www.probuilds.net/champions/details/"
  def self.scrape_champion_page(index_url)

  end
  def self.scrape_summoner_page(summoner)
    url = SUMMONER_LOOKUP+summoner.url_name
    doc = Nokogiri::HTML(open(url))
    summoner.rank = doc.css('.tierRank').text
    summoner.lp = doc.css('.LeaguePoints').text.strip
    summoner.win_ratio = doc.css('.winratio').text
  end

  def self.champion_build(champions)
      champions.each do |champ|
      name = champ.name.split(' ').join('')
      url = CHAMP_LOOKUP+name
      doc = Nokogiri::HTML(open(url))
      doc.css(".left.clear").css('.item-name.gold').each {|name| champ.build << name.text}
    end
  end

  def self.summ_champ_stats(summoner)
    url = SUMMONER_LOOKUP+summoner.url_name
    doc = Nokogiri::HTML(open(url))
    doc.css(".ChampionBox.Ranked").each do |champ|
      attrs = {}
      attrs[:name] = champ.css(".ChampionName").text.strip
      attrs[:my_winpercent] = champ.css(".Played").text.strip[0..3]
      attrs[:cs] = champ.css(".cs.average").text
      attrs[:player] = summoner
      Champion.new(attrs)
  end

end





end