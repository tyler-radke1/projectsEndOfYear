import UIKit
extension Int {
    func isEven() -> Bool {
        return (self % 2 == 0) ? true : false
    }
    
    
}





func availableSpots(nums: [Int], hombre: Int) -> Int {
    
    var spotsLiked = 0
    
        for (index, number) in nums.enumerated() {
            guard index != 0, index != nums.count else { continue }
            
            //If hombre given is even, switches on the number being even, if false, switches on the number
            //being false
            switch hombre.isEven() ? number.isEven() : !number.isEven() {
            case true:
                spotsLiked += 1
            case false:
                //if number is even or odd according hombre, runs a ternary operator checking even the previous spot is.
                if hombre.isEven() {
                    spotsLiked += nums[index - 1].isEven() ? 1 : 0
                } else {
                    spotsLiked += !nums[index - 1].isEven() ? 1 : 0
                }
            }
        }
    
    return spotsLiked
}
availableSpots(nums: [0,3,5,7,8,3,5,6,7,9,10,13], hombre: 9)
