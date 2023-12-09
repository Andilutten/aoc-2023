require "debug"
require "predictor"

module Program
  extend Predictor

  def self.star_one(lines)
    lines.map do |line|
      nums = line.split " "
      nums = predict nums.map &:to_i
      nums.last
    end.sum
  end

  def self.star_two(lines)
    "Not implemented"
  end

end
