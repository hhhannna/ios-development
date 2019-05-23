

import Foundation

// read line
var numTotal = 0
var number: Int!

while number != 0 {
    
    print("Give number ")
    
    if let line = readLine() {
        // text line is given (letters or maybe just enter is pressed)
        // try to conver to number
         number = Int(line)
        // if yes then number contains a number
        if number != nil {
            // we are sure that it is a number, we can use number! (forced unwrapping of the optional’s value)
            // your own code starts here...
            //
        numTotal += number
            
        } else {
            print("You don't give a number!")
        }
    } else {
        // for example ctrl-d is pressed == "end of file"
        print("There is no text given!")
    }
    
}
print("Sum is \(numTotal)")



//


