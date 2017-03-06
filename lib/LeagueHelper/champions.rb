
class Champion
  attr_accessor :name, :my_winpercent, :cs, :build

  def initialize(attributes_hash)
    attributes_hash.each { |k, v| self.send(("#{k}="), v) }
    @build = []
  end

  def self.create_from_collection(champions_array)
    champions_array.each { |character| champion = champion.new(character) }
  end

  def player=(summoner)
    summoner.champions << self
  end


end
