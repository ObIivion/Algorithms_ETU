//
//  MatrixGenerator.swift
//  Alg_ETU
//
//  Created by Pavel Vinogradov on 22.03.2024.
//

import Foundation

final class MatrixManager {
    
    func generate(matrixSize: Int) -> [[Int]] {
        var matrix: [[Int]] = [[]]
        
        for _ in 0..<matrixSize {
            var row: [Int] = []
            
            for _ in 0..<matrixSize {
                let randomInt = Int.random(in: 1...1000)
                row.append(randomInt)
            }
            
            matrix.append(row)
        }
        
        return Array(matrix.dropFirst())
    }
    
    func printRows(matrix: [[Int]]) {
        for row in matrix {
            print(row)
        }
    }
}
