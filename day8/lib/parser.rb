module Parser
  def parse(lines)
    instructions = parse_instructions lines[0]
    map = parse_map lines[2..]
    [instructions, map]
  end
  
  private
    def parse_instructions(line)
      line.split("").map do |direction|
        direction == 'L' ? 0 : 1
      end
    end
    def parse_map(lines)
      lines.reduce({}) do |memo, line|
        matches = line.match /(?<key>\S+) = \((?<left>\S+), (?<right>\S+)\)/ 
        memo[matches["key"]] = [matches["left"], matches["right"]]
        memo
      end
    end
end
