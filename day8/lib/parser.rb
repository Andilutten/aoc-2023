module Parser
  def parse(lines)
    instructions = parse_instructions lines[0]
    map = parse_map lines[2..]
    [instructions, map]
  end
  
  private
    def parse_instructions(line)
      line.sub("\n", "").split("").map do |direction|
        direction == 'L' ? 0 : 1
      end
    end
    def parse_map(lines)
      lines.reduce({_starts: []}) do |memo, line|
        matches = line.match /(?<key>\S+) = \((?<left>\S+), (?<right>\S+)\)/ 
        if matches["key"].end_with? "A"
          memo[:_starts].push matches["key"]
        end
        memo[matches["key"]] = [matches["left"], matches["right"]]
        memo
      end
    end
end
