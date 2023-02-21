import UIKit
import Foundation



func splitNCases(_ str: String, cases: Int) -> [String]? {
    guard (cases % str.count) != 0 else { return nil}
    
    var count = 0
    let splitNumber = str.count / cases
    
    var secondString: String = ""
    var array: [String] = []
    
    
    
        str.forEach({ letter in
         
            secondString += String(letter)
            count += 1
                
            if count == splitNumber {
                array.append(secondString)
                secondString = ""
                count = 0
            }
            
            
        })
    
    return array
    }
    
   

splitNCases("scrumdidlyumptious", cases: 4)
