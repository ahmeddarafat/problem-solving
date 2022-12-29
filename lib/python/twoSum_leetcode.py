# Problem Name : Two Sum
# Problem Link : https://leetcode.com/problems/two-sum/submissions/


class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        map = {}
        for i in range(len(num)):
            if num[i] not in map:
                map[target - num[i]] = i
            else:
                return map[num[i]], i
        return -1, -1
    
# -----------------------------------------------------------------

# Primary

class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        loop = len(nums)
        for i in range(loop):
            for j in range(i+1,len(nums)):
                if nums[i] + nums[j] == target:
                    l = []
                    l.append(num[i])
                    l.append(num[j])
                    return l
