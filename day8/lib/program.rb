require "parser"

module Program
  extend Parser

  def self.star_one(lines)
    instructions, map = parse lines
    self.run "AAA", instructions, map do |step|
      step == "ZZZ"
    end
  end

  def self.run(start, instructions, map)
    counter = 0
    step = start
    loop do
      break if yield(step)

      instruction = instructions[counter % instructions.length]
      step = map[step][instruction]

      counter += 1
    end
    counter
  end

  def self.star_two(lines)
    instructions, map = parse lines
    starts = map[:_starts]

    starts.map do |start|
      self.run start, instructions, map do |step|
        step.end_with? "Z"
      end
    end.reduce(1, :lcm)
  end
end
