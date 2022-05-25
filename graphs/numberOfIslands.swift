// 200. Number of Islands
// Medium
// https://leetcode.com/problems/number-of-islands/
// Share
// Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands.

// An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

 

// Example 1:

// Input: grid = [
//   ["1","1","1","1","0"],
//   ["1","1","0","1","0"],
//   ["1","1","0","0","0"],
//   ["0","0","0","0","0"]
// ]
// Output: 1
// Example 2:

// Input: grid = [
//   ["1","1","0","0","0"],
//   ["1","1","0","0","0"],
//   ["0","0","1","0","0"],
//   ["0","0","0","1","1"]
// ]
// Output: 3

// Elegant DFS solution
 struct DFSElement:Hashable{
        let row: Int
        let col: Int
        
        init(_ row: Int, _ col: Int){
            self.row = row
            self.col = col
        }
    }
    
    func numIslands(_ grid: [[Character]]) -> Int {
        var result = 0
        var visited = Set<DFSElement>()
        
        for i in 0 ..< grid.count{
            for j in 0 ..< grid[0].count {
                guard !visited.contains(DFSElement(i,j)) else {continue}
                if grid[i][j] == "1" {
                    result += 1
                    dfs(grid,i,j,&visited)
                }
            }
        }
        
        return result
    } 
    
    func dfs(_ grid: [[Character]],_ row:Int, _ col: Int,_ visited: inout Set<DFSElement>) {
        visited.insert(DFSElement(row,col))
        
        for (row1,col1) in [(row + 1,col),(row - 1,col),(row,col + 1),(row,col - 1)] {
            guard (row1 >= 0 && row1 < grid.count && col1 >= 0 && col1 < grid[0].count) else {
                continue
            }

            guard !visited.contains(DFSElement(row1,col1)) else {
                continue}
            if grid[row1][col1] == "1"{
                dfs(grid,row1,col1,&visited)
            }
        }
    }
}

// Other solution
class Solution {
    var visitedNodes:[[Bool]] = [[]] 
    func numIslands(_ grid: [[Character]]) -> Int {
        if grid.count == 0 {return 0}
        
        let rowCount = grid[0].count
        let colCount = grid.count
        
        let visitedRows = Array(repeating:false,count: rowCount)
        visitedNodes = Array(repeating:visitedRows,count: colCount)
        
        var count = 0
        
        for i in 0 ..< colCount{
            for j in 0 ..< rowCount{
                if visitedNodes[i][j] {
                    continue
                }        
                
                if grid[i][j] == "1"{
                    count += 1
                    findTheIsLand(grid,row:j,col:i)
                }
                
                visitedNodes[i][j] = true
            }
        }
        
        return count
    }
    
    func findTheIsLand(_ grid:[[Character]], row:Int,col: Int) {
        visitedNodes[col][row] = true
        
        // top
        if col > 0{
            if visitedNodes[col-1][row] == false && grid[col - 1][row] == "1"{
                findTheIsLand(grid,row:row,col:col-1)
            }
        }
        
        // bottom
        if col < grid.count - 1{
            if visitedNodes[col+1][row] == false && grid[col + 1][row] == "1"{
                findTheIsLand(grid,row:row,col:col+1)
            }
        }
        // left
        if row > 0{
            if visitedNodes[col][row - 1] == false && grid[col][row - 1] == "1"{
                findTheIsLand(grid,row:row - 1,col:col)
            }
        }
        
        // right
        if row < grid[col].count - 1{
                 if visitedNodes[col][row + 1] == false && grid[col][row + 1] == "1"{
                findTheIsLand(grid,row:row + 1,col:col)
            }
        }
    }
}
