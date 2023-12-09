module Program
  def self.run(lines)
    matrix = lines.map.with_index do |line, index|
      enum = line.enum_for(:scan, /(\d+)/)
      enum.map { EnginePart.from_match Regexp.last_match, index }
    end.flatten

    matrix.filter {|x| x.has_adjacent_symbol lines }.map(&:to_i).sum
  end
end

class EnginePart
  def self.from_match(match, index)
    self.new match.begin(0), index, match[1]
  end
  def initialize(x, y, value)
    @x, @y, @value = x, y, value
  end
  def has_adjacent_symbol(lines)
    y_min = [@y-1, 0].max
    y_max = [@y+1, lines.length-1].min
    x_min = [@x-1, 0].max
    x_max = [@x+(@value.length), lines[@y].length].min
    matrix = lines[y_min..y_max].map {|row| row[x_min..x_max]}
    matrix.join.match? /[^\.\d\n]/
  end
  def to_i
    @value.to_i
  end
end
