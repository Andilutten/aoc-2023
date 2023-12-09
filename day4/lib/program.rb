module Parser 
  def parse(line)
    match = line.match /Card +(?<id>\d+): (?<win>[\d\s]+)\|(?<yours>[\d\s]+)/ 
    [match[:id], match[:win].split(" "), match[:yours].split(" ")]
  end
end

module Program
  extend Parser
  def self.star_one(lines)
    lines.map do |line|
      _, win, yours = *parse(line)
      common = win & yours
      common.length > 0 \
        ? 1 << common.length-1 \
        : 0
    end.sum
  end

  def self.star_two(lines)
    copies = Array.new lines.length, 1
    lines.map.with_index do |line, i|
      _, win, yours = *parse(line)
      common = win & yours
      common.each.with_index do |_, j| 
        copies[i+j+1] += copies[i]
      end
    end
    copies.sum
  end
end
