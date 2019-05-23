
import Foundation

var nums: [Int] = []
var number = 0

while true{
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
nums.reverse()
print("Numbers are \(nums)")

