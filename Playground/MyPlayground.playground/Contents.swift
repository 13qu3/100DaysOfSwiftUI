
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
    print(String(repeating: "-", count: size.rawValue))
}

func printCheckpoint(checkpoint: Int) {
    printLineBreak(size: Size.no)
    printLineBreak(size: Size.mx)
    print("Checkpoint \(checkpoint)")
    printLineBreak(size: Size.lg)
    printLineBreak(size: Size.no)
}

printCheckpoint(checkpoint: 1)
let celsius = 1.618
let fahrenheit = celsius * 9 / 5 + 32

print("Hey look, i converted \(celsius)°C to \(fahrenheit)°F")

printCheckpoint(checkpoint: 2)
let students = ["Hans", "Franz", "Klaus", "Philipp", "Hans", "Phillip", "Claus"]
let uniqueNames = Set(students)

print("There are \(uniqueNames.count) unique names among all students \(students.count)")

printCheckpoint(checkpoint: 3)
var fizzBuzzOutput = [String]()

for num in 1 ... 100 {
    if num.isMultiple(of: 3), num.isMultiple(of: 5) {
        fizzBuzzOutput.append("Fizz Buzz")
        continue
    } else if num.isMultiple(of: 3) {
        fizzBuzzOutput.append("Fizz")
        continue
    } else if num.isMultiple(of: 5) {
        fizzBuzzOutput.append("Buzz")
        continue
    } else {
        fizzBuzzOutput.append(String(num))
    }
}

print(fizzBuzzOutput)
