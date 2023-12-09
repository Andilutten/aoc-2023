module Predictor
  def predict(nums)
    if nums.sum == 0
      return nums
    end
    mapper = -> (n, idx) { n - nums[idx] }
    child = self.predict nums.drop(1)
      .map.with_index &mapper
    nums.push child.last + nums.last
    nums
  end
end
