module Predictor
  def predict(nums)
    return nums if nums.all? 0
    mapper = -> (n, idx) { n - nums[idx] }
    child = self.predict nums.drop(1)
      .map.with_index &mapper
    nums.push child.last + nums.last
    nums
  end
end
