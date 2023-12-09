
module Program

  @@number_strs = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

  def self.run(lines)
    lines.map do |line|
      first = line.match /(\d)/
      last = line.reverse.match /(\d)/
      "#{first[1]}#{last[1]}".to_i
    end.sum
  end

  def self.transform(line)
    pattern = Regexp.new "(#{@@number_strs.join('|')})"
    loop do
      match = line.match pattern
      break if match.nil?
      word = match[1]
      value = @@number_strs.index word
      line = line.sub word, (value+1).to_s
    end
    line
  end

  def self.run_two(lines)
    lines.map do |ll|
      line = self.transform ll
      first = line.match /(\d)/
      last = line.reverse.match /(\d)/
      "#{first[1]}#{last[1]}".to_i
    end.sum
  end
end
