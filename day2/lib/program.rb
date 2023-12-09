MAX_RED = 12
MAX_GREEN = 13
MAX_BLUE = 14

module Program

  def self.run(lines)
    lines.map {|x| self.handle x}.compact.sum
  end

  def self.handle(line)
    matches = line.match /^Game (\d+): (.+)$/
    _, id, rounds_str = *matches
    rounds = rounds_str.split(";").map {|x| self.round_to_hash x}

    green = rounds.map {|x| x[:green] }.compact.filter {|x| x > MAX_GREEN}.any?
    red = rounds.map {|x| x[:red] }.compact.filter {|x| x > MAX_RED}.any?
    blue = rounds.map {|x| x[:blue] }.compact.filter {|x| x > MAX_BLUE}.any?

    ok = green || blue || red ? nil : id.to_i
    puts line
    puts ok.nil? ? "INVALID" : "OK"
    ok
  end

  def self.round_to_hash(round)
    default = { green: 0, blue: 0, red: 0}
    round.split(",").map {|set| set.split " "}.reduce(default) do |memo, (value, key)|
      memo[key.to_sym] = value.to_i
      memo
    end
  end

end

