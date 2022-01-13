//
//  Day11.swift
//  JKHomeWork
//
//  Created by Carl Xu on 2022/1/6.
//

import Foundation

/*
 【Day11】 今日打卡题目

 🌸二维区域和检索 - 矩阵不可变-304
 https://leetcode-cn.com/problems/range-sum-query-2d-immutable/

 */
class NumMatrix {
    
    var matrix: [[Int]] = []
    
    // 存储每行的前缀和
    var sumMatrix: [[Int]] = []

    init(_ matrix: [[Int]]) {
        self.matrix = matrix
    }
    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        var sum = 0
        // 累加每行数组的剩余面积
        for r in row1...row2 {
            // 如果col1为0， 着前一行的前缀和为0
            sum += sumRow(r, col2) - (col1 == 0 ? 0 : sumRow(r, col1 - 1))
        }
        return sum
    }
    
    // 第row1行col1的前缀和
    func sumRow(_ row1: Int, _ col1: Int) -> Int {
        var rowSum =  0
        for var j in 0...col1 {
            rowSum += matrix[row1][j]
            j += 1
        }
        return rowSum
    }
    
    
    // 根据每行的前缀和计算row1行col1列的面积
//    func area( row1: Int, _ col1: Int) -> Int {
//        var sum = 0
//        for  i in 0..<row1 {
//            sum += sumMatrix[i][col1]
//        }
//        return sum
//    }
    
    
    func test() {
        let numMatrix =  NumMatrix([[3,0,1,4,2],[5,6,3,2,1],[1,2,0,1,5],[4,1,0,1,7],[1,0,3,0,5]]);
        
//        [[3,0,1,4,2],
//         [5,6,3,2,1],
//         [1,2,0,1,5],
//         [4,1,0,1,7],
//         [1,0,3,0,5]]
//
//        [[3, 3, 4, 8, 10],
//         [5, 11, 14, 16, 17],
//         [1, 3, 3, 4, 9],
//         [4, 5, 5, 6, 13],
//         [1, 1, 4, 4, 9]]
//

        
        let a = numMatrix.sumRegion(2, 1, 4, 3); // return 8 (红色矩形框的元素总和)
        let b = numMatrix.sumRegion(1, 1, 2, 2); // return 11 (绿色矩形框的元素总和)
        let c = numMatrix.sumRegion(1, 2, 2, 4); // return 12 (蓝色矩形框的元素总和)

   
       
        print("sum: \(a)")
        print("sum: \(b)")
        print("sum: \(c)")
        
    }
    
}


