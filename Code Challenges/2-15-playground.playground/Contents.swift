import UIKit


func createHashtag(_ str : String) -> String {
    var arr = str.components(separatedBy: " ")
    
    for (index, word) in arr.enumerated() {
        let letter = word.first?.uppercased()
        arr[index].first = letter
    }
    
    return "#" + arr.joined()
}


func simplifyFraction(_ frac: String) -> String? {
    
    
    var split = frac.split(separator: "/").map{ Int($0)! }
    var numberator = split.first!
    var denominator = split.last!
    
    for number in 1...denominator {
        if numberator.isMultiple(of: number) && denominator.isMultiple(of: number){
            denominator /= number
            numberator /= number
        }
    }
    
    return "\(numberator)/\(denominator)"
    
    
    
    
}

simplifyFraction("40/70")
