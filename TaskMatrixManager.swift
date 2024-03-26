//
//  TaskMatrixManager.swift
//  Alg_ETU
//
//  Created by Pavel Vinogradov on 22.03.2024.
//

import Foundation

class TaskMatrixManager {
    
    func multiplyMatrixElements(matrix: [[Int]]) -> Double {
        var result: Double = 1
        
        for row in matrix {
            for element in row {
                result *= Double(element)
            }
        }
        
        return result
    }
    
    func sumMatrixElements(matrix: [[Int]]) -> Int {
        var result = 0
        
        for row in matrix {
            for element in row {
                result += element
            }
        }
        
        return result
    }
}

extension TaskMatrixManager {
    
    func findMaxElementInMatrix(matrix: [[Int]]) -> Int {
        var maxElement = Int.min
        
        for row in matrix {
            for element in row {
                if element > maxElement {
                    maxElement = element
                }
            }
        }
        
        return maxElement
    }
    
    func findMinElementInMatrix(matrix: [[Int]]) -> Int {
        var minElement = Int.max
        
        for row in matrix {
            for element in row {
                if element < minElement {
                    minElement = element
                }
            }
        }
        
        return minElement
    }
}

extension TaskMatrixManager {
    
    func elementsInRowOrder(matrix: [[Int]]) -> [Int] {
        var elementsInRowOrder = [Int]()
        
        for row in matrix {
            elementsInRowOrder += row
        }
        
        return elementsInRowOrder
    }
    
}

extension TaskMatrixManager {
    
    func findLocalMaximumsInMatrix(matrix: [[Int]]) -> [Int] {
        var maximums: [Int] = []
        
        for i in 0..<matrix.count {
            for j in 0..<matrix[i].count {
                let currentElement = matrix[i][j]
                let top: Int
                let left: Int
                let right: Int
                let bottom: Int
                
                if i - 1 < 0 {
                    top = -1
                } else {
                    top = matrix[i-1][j]
                }
                
                if i + 1 > matrix.count - 1 {
                    bottom = -1
                } else {
                    bottom = matrix[i+1][j]
                }
                
                if j - 1 < 0 {
                    left = -1
                } else {
                    left = matrix[i][j-1]
                }
                
                if j + 1 > matrix.count - 1 {
                    right = -1
                } else {
                    right = matrix[i][j+1]
                }
                
                if currentElement > top && currentElement > bottom && currentElement > left && currentElement > right {
                    maximums.append(currentElement)
                }
            }
        }
        
        return maximums
    }
    
}

extension TaskMatrixManager {
    
    func minFromRowMaximums(matrix: [[Int]]) -> Int {
        var rowMaximums: [Int] = []
        
        for row in matrix {
            let max = row.findMax()
            rowMaximums.append(max)
        }
        print("Максимумы строк: ", rowMaximums)
        return Array(rowMaximums.dropFirst()).findMin()
    }
}

extension TaskMatrixManager {
    
    func maxFromColMinimums(matrix: [[Int]]) -> Int {
        let rows = matrix.count // количество строк матрицы (по сути - количество одномерных массивов в рамках двумерного)
        let columns = matrix[0].count // количество столбцов матрицы (по сути - число элементов в одной строке)
        
        var colMinimums: [Int] = []
        
        for col in 0..<columns {
            var min = Int.max
            
            for row in 0..<rows {
                if matrix[row][col] < min {
                    min = matrix[row][col]
                }
            }
            
            colMinimums.append(min)
        }
        
        print("Минимумы колонок: ", colMinimums)
        
        return Array(colMinimums.dropFirst()).findMax()
    }
    
}

extension TaskMatrixManager {
    
    func saddlePoint(matrix: [[Int]]) -> [Int] {
        var saddleElements: [Int] = []
        
        for row in matrix {
            let rowMax = row.maxAndIndex()
            let rowMin = row.minAndIndex()
            
            var colMin = Int.max
            for row2 in matrix {
                if row2[rowMax.index] < colMin {
                    colMin = row2[rowMax.index]
                }
            }
            
            var colMax = Int.min
            for row3 in matrix {
                if row3[rowMin.index] > colMax {
                    colMax = row3[rowMin.index]
                }
            }
            
            if rowMax.element == colMin {
                saddleElements.append(rowMax.element)
            }
            
            if rowMin.element == colMax {
                saddleElements.append(rowMin.element)
            }
            
        }
        
        return saddleElements
    }
    
}
