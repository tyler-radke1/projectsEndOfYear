import UIKit

func persist(number: Int) -> Int {
    var total = number
    var count = 0
    var splitArray: [Int] = []
    
    while total >= 10 {
        splitArray = String(total).compactMap{ $0.wholeNumberValue }
        total = splitArray.reduce(0, +)
        count += 1
    }
    
    
    return count
    
   
}


