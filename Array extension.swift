//
//  Int Array + min and max.swift
//  Alg_ETU
//
//  Created by Pavel Vinogradov on 24.03.2024.
//

extension Array where Element == Int {
    
    func findMax() -> Element {
        var max = Element.min
        
        for element in self {
            if element > max {
                max = element
            }
        }
        
        return max
    }
    
    func findMin() -> Element {
        var min = Element.max
        
        for element in self {
            if element < min {
                min = element
            }
        }
        
        return min
    }
    
    func minAndIndex() -> (element: Element, index: Int) {
        var min = Element.max
        var minIndex = 0
        
        for i in 0..<self.count {
            if self[i] < min {
                min = self[i]
                minIndex = i
            }
        }
        
        return (element: min, index: minIndex)
    }
    
    func maxAndIndex() -> (element: Element, index: Int) {
        var max = Element.min
        var maxIndex = 0
        
        for i in 0..<self.count {
            if self[i] > max {
                max = self[i]
                maxIndex = i
            }
        }
        
        return (element: max, index: maxIndex)
    }
    
}
