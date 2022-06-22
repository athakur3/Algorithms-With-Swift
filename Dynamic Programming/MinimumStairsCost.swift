// https://leetcode.com/problems/min-cost-climbing-stairs/

// You are given an integer array cost where cost[i] is the cost of ith step on a staircase. Once you pay the cost, you can either climb one or two steps.

// You can either start from the step with index 0, or the step with index 1.

// Return the minimum cost to reach the top of the floor.

 

// Example 1:

// Input: cost = [10,15,20]
// Output: 15
// Explanation: You will start at index 1.
// - Pay 15 and climb two steps to reach the top.
// The total cost is 15.
// Example 2:

// Input: cost = [1,100,1,1,1,100,1,1,100,1]
// Output: 6
// Explanation: You will start at index 0.
// - Pay 1 and climb two steps to reach index 2.
// - Pay 1 and climb two steps to reach index 4.
// - Pay 1 and climb two steps to reach index 6.
// - Pay 1 and climb one step to reach index 7.
// - Pay 1 and climb two steps to reach index 9.
// - Pay 1 and climb one step to reach the top.
// The total cost is 6.

// Simple solution
class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        // knapsack problem
        var numberOfStairs = cost.count
        // creating minCostArray
        var minCostArray = [Int](repeating:-1,count:numberOfStairs)
        var stairLocation = 0
        
        while stairLocation < numberOfStairs {    
            if stairLocation >= 2 {
                minCostArray[stairLocation] = min(minCostArray[stairLocation - 1],minCostArray[stairLocation - 2]) + cost[stairLocation]
            }else if stairLocation == 1{
                minCostArray[stairLocation] = min(minCostArray[0] + cost[1],cost[1]) 
            }else{
                minCostArray[stairLocation] = cost[stairLocation]
            }
          
           // storing minimum cost to current array by using formula
           // min(minCostArray[n-1],minCostArray[n-2]) + currentCost -> This formula looks similar to fibbonacci series but we need to find a way to keep cost
            
            stairLocation += 1
        }
        
        return min(minCostArray[stairLocation - 1],minCostArray[stairLocation - 2])
    }
}
