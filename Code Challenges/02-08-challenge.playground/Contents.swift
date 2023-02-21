import UIKit

struct Point {
    var x: Int
    var y: Int
}

enum DirectionFacing {
    case north,east,south,west
}

func roamingRobot(pos: [Int]) -> Point {
    var x = 0
    var y = 0
    var directionFacing: DirectionFacing = .north
    
    for num in pos {
        switch directionFacing {
        case .north:
            y += num
            directionFacing = .east
        case .east:
            x += num
            directionFacing = .south
        case .south:
            y -= 10
            directionFacing = .west
        case .west:
            x -= num
            directionFacing = .north
        }
    }
    
    return Point(x: x, y: y)
}


roamingRobot(pos: [20,30,10,40])
