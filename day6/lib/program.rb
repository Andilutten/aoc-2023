module Program
  def self.star_one(lines)
    time_str, records_str = *lines
    times   = time_str.scan(/\d+/).map &:to_i
    records = records_str.scan(/\d+/).map &:to_i
    pairs   = times.zip records

    pairs.map {|x| self.handle x}.inject :*
  end
  def self.star_two(lines)
    time_str, records_str = *lines
    times   = time_str.gsub(" ", "").scan(/\d+/).map &:to_i
    records = records_str.gsub(" ", "").scan(/\d+/).map &:to_i
    pairs   = times.zip records

    pairs.map {|x| self.handle x}.inject :*
  end

  def self.handle(pair)
    time, record = *pair
    (1..time).filter do |speed|
      burn_time = time - speed
      distance  = burn_time * speed
      distance > record
    end.length
  end
end
