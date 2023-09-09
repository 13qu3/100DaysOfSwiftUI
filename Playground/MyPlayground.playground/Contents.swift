
import Cocoa

enum Size: Int {
    case no = 0
    case xs = 3
    case sm = 5
    case md = 8
    case lg = 13
    case xl = 21
    case mx = 34
}

func printLineBreak(size: Size) {
//    print(type(of: size.rawValue))
    print(String(repeating: "-", count: size.rawValue))
}

func printCheckpoint(checkpoint: Int) {
    printLineBreak(size: Size.no)
    printLineBreak(size: Size.mx)
    print("Checkpoint \(checkpoint)")
    printLineBreak(size: Size.lg)
    printLineBreak(size: Size.no)
}

// Checkpoint 1:
// Your goal is to write a Swift playground that:

// Creates a constant holding any temperature in Celsius.
// Converts it to Fahrenheit by multiplying by 9, dividing by 5, then adding 32.
// Prints the result for the user, showing both the Celsius and Fahrenheit values.
printCheckpoint(checkpoint: 1)
let celsius = 1.618

let fahrenheit = celsius * 9 / 5 + 32

print("Hey look, i converted \(celsius)°C to \(fahrenheit)°F")

printCheckpoint(checkpoint: 2)
let students = ["Hans", "Franz", "Klaus", "Philipp", "Hans", "Phillip", "Claus"]
let uniqueNames = Set(students)

print("There are \(uniqueNames.count) unique names among all students \(students.count)")

