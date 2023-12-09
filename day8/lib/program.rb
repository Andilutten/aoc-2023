require "parser"

module Program
  extend Parser

  def self.star_one(lines)
    instructions, map = parse lines
    counter = 0
    step = "AAA"
    loop do
      break if step == "ZZZ"

      instruction = instructions[counter % instructions.length]
      step = map[step][instruction]

      counter += 1
    end
    counter
  end

  def self.star_two(lines)
    "Not implemented"
  end
end
