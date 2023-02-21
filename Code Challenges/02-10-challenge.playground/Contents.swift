import UIKit






func timeAdjust(day: String, hr: Int, min: Int, sec: Int) -> String {
   
    
    
    
    var hrTwo = hr
    var minTwo = min
    var secTwo = sec
    
    let numsToAdd = [hrTwo, minTwo, secTwo]
    var numbers = day.components(separatedBy: ":").map( { Int($0) })
    
    
    var addToSeconds = numbers[2]
    var addToMinutes = 0
    var addToHours = 0
    
    if secTwo >= 60 {
       
        addToMinutes = secTwo / 60
        secTwo = secTwo % 60
    }
    
    
    minTwo += addToMinutes
    
    if minTwo >= 60 {
        if minTwo + addToMinutes < 60 {
            minTwo += addToMinutes
        }
        
        addToHours = minTwo / 60
        minTwo = minTwo % 60
    }
    
   
    hrTwo += addToHours
    
    
    
    for (index, _) in numbers.enumerated() {
        numbers[index]! += numsToAdd[index]
    }
    
    
    return "\(numbers[0]!):\(numbers[1]!):\(numbers[2]!)"
    
}

timeAdjust(day: "18:22:30", hr: 4, min: 60, sec: 31)



//timeAdjuster2(time: String, hr: Int, min: Int, sec: Int) -> String {
//
//}
