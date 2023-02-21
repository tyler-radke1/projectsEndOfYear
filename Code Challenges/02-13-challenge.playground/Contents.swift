import UIKit

enum SortBy {
    case suffix, prefix
}


func cleanUp(files: [String], _ sortBy: SortBy) -> [[String]] {
    
    var separators: [String] = []
    var answer: [[String]] = []
    
    for file in files {
        
        if let i = file.firstIndex(of: ".") {

            let separator = (sortBy == .suffix) ? file.suffix(from: i) : file.prefix(through: i)
            if !separators.contains(String(separator)) {
                separators.append(String(separator))
            }
                

        }
        
    
        separators = Array(Set(separators.sorted()))
        
        
        for separator in separators {
            answer.append(files.filter({$0.contains(separator)}))
        }
        
    }
    
    return Array(Set(answer))
}


cleanUp(files: ["ex1.html", "ex1.js", "ex2.html", "ex2.js"], .prefix)
cleanUp(files: ["music_app.js", "music_app.png", "music_app.wav", "tetris.png", "tetris.js"], .suffix)
