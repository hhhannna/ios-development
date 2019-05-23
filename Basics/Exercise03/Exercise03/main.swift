
import Foundation

var nums: [Int] = []
for _ in 1...3 {
    
print("Give number")
// read line
if let line = readLine() {
    // text line is given (letters or maybe just enter is pressed)
    // try to conver to number
    let number = Int(line)
    // if yes then number contains a number
    if number != nil {
        // we are sure that it is a number, we can use number! (forced unwrapping of the optional’s value)
        nums.append(number!)
        
    } else {
        print("You don't give a number!")
    }
} else {
    // for example ctrl-d is pressed == "end of file"
    print("There is no text given!")
}
}

let numsTotal = nums.reduce(0, +)
let numsAvg = numsTotal / nums.count
print("Sum is \(numsTotal)")
print("Average is \(numsAvg)")
