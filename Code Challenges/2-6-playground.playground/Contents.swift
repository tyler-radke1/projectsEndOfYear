import UIKit
import Foundation


func getFibs(_ n: Int) -> [Int]? {
    if n < 2 {return [0] } else if n == 0 {return nil}
    
    var arr = [0,1,1] + [Int](repeating: 0, count: n - 3)
    let range = 2..<n
    
        
    range.forEach({ arr[$0] = arr[$0 - 2] + arr[$0-1] })
    return arr
    
}

getFibs(7)
getFibs(1)
getFibs(0)
getFibs(30)
