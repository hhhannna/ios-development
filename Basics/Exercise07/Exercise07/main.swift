
import Foundation

let target = Int.random(in: 0...100)
var number: Int!
var count = 0

print("Guess a number between 0-100")
while number != target {
    count += 1
    
// read line
if let line = readLine() {
    // text line is given (letters or maybe just enter is pressed)
    // try to conver to number
    number = Int(line)
    // if yes then number contains a number
    if number != nil {
        // we are sure that it is a number, we can use number! (forced unwrapping of the optional’s value)
        // your own code starts here...
        //
        if number < target {
            print("Number is bigger")
        }
        else if number > target {
            print("Number is smaller")
        }
        
        
    } else {
        print("You don't give a number!")
    }
} else {
    // for example ctrl-d is pressed == "end of file"
    print("There is no text given!")
}
}
print("Great, it takes \(count) guesses")
