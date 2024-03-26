//
//  main.swift
//  Alg_ETU
//
//  Created by Pavel Vinogradov on 22.03.2024.
//

import Foundation

class MainClass {
    
    private let manager: MatrixManager
    private let tasks: TaskMatrixManager
    
    private var matrix: [[Int]] = [[]]
    
    init(
        manager: MatrixManager = MatrixManager(),
        tasks: TaskMatrixManager = TaskMatrixManager()
    ) {
        self.manager = manager
        self.tasks = tasks
    }
    
    func start() {
        print("Welcome to the course work!")
        menu(command: "generate")
    }
    
    func menu(command: String) {
        switch command {
        case "generate":
            print("Please, chose matrix size using Integer datatype: ")
            let userInput = readLine()
            let newMatrix = generateAndWrite(size: Int(userInput!) ?? 12)
            matrix = newMatrix
            print("\nWrite \"generate\" to regenerate matrix with new size")
            print("Write \"execute\" to execute tasks with current matrix")
            let userInput2 = readLine() ?? ""
            menu(command: userInput2)
            
        case "execute":
            execute(matrix: matrix)
            
        default:
            menu(command: "generate")
        }
    }
    
    func generateAndWrite(size: Int) -> [[Int]] {
        let timeStart = DispatchTime.now()
        let matrix = manager.generate(matrixSize: size)
        let timeEnd = DispatchTime.now()
        
        let executionTime = timeEnd.uptimeNanoseconds - timeStart.uptimeNanoseconds
        let milliseconds = Double(executionTime) / 1_000_000
        
//        manager.printRows(matrix: matrix)
        print("Execution time: \(milliseconds) milliseconds")
        return matrix
    }
    
    func execute(matrix: [[Int]]) {
        let sum = tasks.sumMatrixElements(matrix: matrix)
        print("Сумма элементов: ", sum)
        
        let multiply = tasks.multiplyMatrixElements(matrix: matrix)
        print(multiply)
        
        let elementsRowByRow = tasks.elementsInRowOrder(matrix: matrix)
        print("Перечисление элементов построчно: ", elementsRowByRow)
        
        let localMaximums = tasks.findLocalMaximumsInMatrix(matrix: matrix)
        print("Локальные максимумы: ", localMaximums)
        
        let minFromRowMaximums = tasks.minFromRowMaximums(matrix: matrix)
        print("Минимум из максимумов каждой строки: ", minFromRowMaximums)
        
        let maxFromColMinimums = tasks.maxFromColMinimums(matrix: matrix)
        print("Максимум из минимумов каждого столбца: ", maxFromColMinimums)
        
        let saddlePoints = tasks.saddlePoint(matrix: matrix)
        print("Седловые точки: ", saddlePoints)
    }
    
}

let mainClass = MainClass()
mainClass.start()
