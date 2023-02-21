import UIKit
import Foundation




enum CaseToConvertTo {
    case camel,snake
}
extension String {
    var capitalizedSentence: String {
        // 1
        let firstLetter = self.prefix(1).capitalized
        // 2
        let remainingLetters = self.dropFirst().lowercased()
        // 3
        return firstLetter + remainingLetters
    }
    
    var hasNoUpperCases: Bool {
        for letter in self {
            if letter.isUppercase {
                return false
            }
        }
        
        return true
    }
}

func convert(_ string: String, toCase: CaseToConvertTo) -> String {
    if toCase == .camel {

        
        var stringArray = string.components(separatedBy: "_")
        
        for (i,_) in stringArray.enumerated() {
            if i == 0 {
               continue

            } else {
                let letter = stringArray[i].first
                stringArray[i] = stringArray[i].capitalizedSentence
            }

        }

        return stringArray.joined()
    } else if toCase == .snake {
            
        string.forEach({
            if $0.isUppercase {
                // = "_\($0.lowercased())"
            }
            
            
        })
        
        
        
        
        
    }
}

convert("testing_function", toCase: .camel)
