module Program
  def self.star_one(lines)
    seeds = lines[0].scan(/(\d+)/).flatten.map &:to_i
    maps = self.parse_maps lines
    self.find_lowest seeds, maps
  end

  def self.star_two(lines)
    puts "ONE"
    seeds = lines[0].scan(/(\d+) (\d+)/).map do |range| 
      start = range[0].to_i
      offset = range[1].to_i
      stop = start + offset - 1
      (start..stop).to_a
    end.flatten
    puts "TWO"
    maps = self.parse_maps lines
    self.find_lowest seeds, maps
  end

  def self.parse_maps(lines)
    puts "Parsing maps"
    maps = lines.join(",").gsub("\n", "").split(",,").drop(1).map do |line|
      match = line.gsub(",", " ").match /(\w+)-to-(\w+) map: (.+)/
      ranges = match[3].scan(/(\d+) (\d+) (\d+)/)
      Map.new do |m|
        m.source = match[1]
        m.destination = match[2]
        m.ranges = ranges.map do |range|
          Range.new range
        end
      end
    end
    maps.reduce({}) do |memo, range|
      memo[range.source] = range
      memo
    end
  end

  def self.find_lowest(seeds, maps)
    seeds.map do |seed|
      source = "seed"
      value = seed
      loop do
        break if source == "location"
        range = maps[source].ranges.find do |map|
          map.check value
        end
        if not range.nil?
          value = range.map value
        end
        source = maps[source].destination
      end
      value
    end.min
  end
end

class Map 
  attr_accessor :destination, :source, :ranges
  def initialize
    yield(self)
  end
end

class Range
  attr_accessor :destination, :source, :length
  def initialize(range)
    @destination = range[0].to_i
    @source = range[1].to_i
    @length = range[2].to_i
  end

  def check(value)
    (@source..@source + @length).include? value
  end

  def map(value)
    offset = value - @source
    @destination + offset
  end
end
