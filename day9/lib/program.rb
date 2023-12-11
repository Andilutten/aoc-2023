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
    lines.map do |line|
      nums = line.split " "
      nums = predict_backwards nums.map &:to_i
      nums.first
    end.sum
  end

end
