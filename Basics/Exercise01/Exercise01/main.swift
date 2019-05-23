
import Foundation


print("Give number")
if let line = readLine() {

    let number = Int(line)

    if number != nil {

        if number == 1 {
            print("Number is one")
        }
        else if number == 2 {
            print("Number is two")
        }
        else if number == 3 {
            print("Number is three")
        }
        else {
            print("Some other number")
        }

    } else {
        print("You don't give a number!")
    }
} else {
    print("There is no text given!")
}

