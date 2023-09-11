
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

// let string1 =  "Swift seem's "
// let string2 =  "very nice!"
let string1 = "hate"
let string2 = "hate"

func compareStrings(str1: String, str2: String) -> Bool {
  let hasSameChars = str1.sorted() == str2.sorted()
  print("""

  Task while lesson

   - \(str1) \(hasSameChars ? "has" : "has not") the same characters as \(str2)
  """)

  return str1.sorted() == str2.sorted()
}

compareStrings(str1: string1, str2: string2)

func pythagoras(a: Double, b: Double) -> Double {
  let powA = pow(a, 2)
  let powB = pow(b, 2)
  let powC = powA + powB
  let c = sqrt(powC)

  print(" - The power of \(a)(\(powA)) plus the power of \(b) (\(powB)) is the power of \(c) (\(powC))")

  return c
}

pythagoras(a: 3, b: 4)
