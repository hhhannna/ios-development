
import Foundation
print("Give score points: ")
// read line
if let line = readLine() {
    // text line is given (letters or maybe just enter is pressed)
    // try to conver to number
    let number = Int(line)
    // if yes then number contains a number
    if number != nil {
        // we are sure that it is a number, we can use number! (forced unwrapping of the optional’s value)
        // your own code starts here...
        //
        switch number! {
        case 0...1:
            print("School grade number is 0")
        case 2...3:
            print("School grade number is 1")
        case 4...5:
            print("School grade number is 2")
        case 6...7:
            print("School grade number is 3")
        case 8...9:
            print("School grade number is 4")
        case 10...12:
            print("School grade number is 5")
        default:
            print("Some other character")
        }
    } else {
        print("You don't give a number!")
    }
} else {
    // for example ctrl-d is pressed == "end of file"
    print("There is no text given!")
}
