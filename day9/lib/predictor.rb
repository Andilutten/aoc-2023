module Predictor
  def predict(nums)
    return nums if nums.all? 0
    mapper = -> (n, idx) { n - nums[idx] }
    child = self.predict nums.drop(1)
      .map.with_index &mapper
    nums.append child.last + nums.last
    nums
  end
  def predict_backwards(nums)
    return nums if nums.all? 0
    mapper = -> (n, idx) { n - nums[idx] }
    child = self.predict_backwards nums.drop(1)
      .map.with_index &mapper
    nums.prepend nums.first - child.first
    nums
  end
end
