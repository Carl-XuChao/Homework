//
//  Day18.swift
//  JKHomeWork
//
//  Created by Carl Xu on 2022/1/13.
//

import Foundation

/* 50. Pow(x, n)
 https://leetcode-cn.com/problems/powx-n/
 */


class Pow {
    
    

    
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1
        } else if n < 0 {
            return  myPow(1.0 / x, -n)
        }
        let isOdd = n % 2 == 0 ? 1 : x
        return myPow(x, n / 2) * myPow(x, n / 2) * isOdd
    }
    
    
}
