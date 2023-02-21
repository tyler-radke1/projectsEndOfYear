import UIKit


func findDivisor(a: Int, b: Int) -> Int {
    
    var aDivisors: [Int] = []
    var secondA = a
    
    var bDivisors: [Int] = []
    var secondB = b
    
    while secondB != 1 {
        bDivisors.append(secondB)
        secondB /= 2
    }
    
    while secondA != 1 {
        aDivisors.append(secondA)
        secondA /= 2
    }
   
    return aDivisors.filter( { bDivisors.contains($0) }).sorted().last!
    
}

findDivisor(a: 9, b: 18)


func findMultiple(a: Int, b: Int) -> Int {
    
    return (a * b) / findDivisor(a: a, b: b)
    
}
let start = CFAbsoluteTimeGetCurrent()
findMultiple(a: 364613, b: 192867)
let seconds = CFAbsoluteTimeGetCurrent() - start

print("took \(seconds) seconds")

