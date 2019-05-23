
import Foundation

var grades = Array(repeating: 0, count: 6)
var nums: [Int] = []
var number = 0

while true {
    // read line
    print("Give number")
    
    if let line = readLine() {
        // text line is given (letters or maybe just enter is pressed)
        // try to conver to number
        let number = Int(line)
        // if yes then number contains a number
        if number != nil {
            // we are sure that it is a number, we can use number! (forced unwrapping of the optional’s value)
            // your own code starts here...
            //
            nums.append(number!)
            
        } else {
            print("Not a number")
            break
        }
    } else {
        // for example ctrl-d is pressed == "end of file"
        print("There is no text given!")
    }
}
for num in nums {
    if num == 0 {
        grades[0] += 1
    } else if num == 1 {
        grades[1] += 1
    } else if num == 2 {
        grades[2] += 1
    } else if num == 3 {
        grades[3] += 1
    } else if num == 4 {
        grades[4] += 1
    } else if num == 5 {
        grades[5] += 1
    }
}

for index in 0...5 {
    print("\(index):", terminator:"")
    for _ in 1...grades[index] {
        print("*", terminator:"")
    }
    print("")
}
