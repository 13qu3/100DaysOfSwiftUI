
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

enum Suit: CaseIterable {
  case hearts
  case diamanods
  case clubs
  case spades
}

enum Rank: CaseIterable {
  case seven
  case eight
  case nine
  case ten
  case jack
  case queen
  case king
  case ace
}

struct Card {
  let suit: Suit
  let rank: Rank
}

struct Deck {
  private let cards: [Card]
  var drawingPile: [Card]
  var discardPile: [Card] = []
  var cardsInGame: [Card] = []

  init() {
    var cards: [Card] = []

    for suit in Suit.allCases {
      for rank in Rank.allCases {
        cards.append(Card(suit: suit, rank: rank))
      }
    }

    self.cards = cards
    self.drawingPile = cards.shuffled()
  }

  mutating func drawCard() -> Card {
    var drawedCard = self.drawingPile.popLast()!
    self.cardsInGame.append(drawedCard)

    if self.drawingPile.isEmpty {
      self.shuffleDiscardPile()
    }

    return drawedCard
  }

  mutating func discardCard(_ card: Card) {
    self.discardPile.append(card)
  }

  mutating func shuffleDiscardPile() {
    print("discard pile shuffled")
    self.drawingPile = self.discardPile.shuffled()
    self.discardPile = []
  }
}

struct Game {
  private var deck: Deck

  init() {
    self.deck = Deck()
  }

  mutating func drawCard() {
    let drawedCard = self.deck.drawCard()
    print("You drawed a \(drawedCard.rank) of \(drawedCard.suit)!")
  }
}

var leGame = Game()

leGame.drawCard()

printCheckpoint(checkpoint: 4)

enum OutOfBoundsError: Error {
  case tooLow, tooHigh
}

enum FindSquareRootOfError: Error {
  case noSquareRoot
  case outOfBounds(OutOfBoundsError)
}

func findSquareRootOf(_ number: Int, from min: Int = 1, to max: Int = 10_000) throws -> Int {
  if number < min { throw FindSquareRootOfError.outOfBounds(.tooLow) }
  if number > max { throw FindSquareRootOfError.outOfBounds(.tooHigh) }

  var squareRoot = 0
  for possibleRoot in min ... max {
    if possibleRoot * possibleRoot == number {
      squareRoot = possibleRoot
      break
    }
  }

  if squareRoot == 0 { throw FindSquareRootOfError.noSquareRoot }

  return squareRoot
}

func printSquareRootOf(_ number: Int) {
  do {
    let squareRoot = try findSquareRootOf(number)
    print(squareRoot)
  } catch FindSquareRootOfError.noSquareRoot {
    print("No root found")
  } catch FindSquareRootOfError.outOfBounds(.tooLow) {
    print("Please enter a number larger than 0")
  } catch FindSquareRootOfError.outOfBounds(.tooHigh) {
    print("Please enter a number smaller than 10.001")
  } catch {
    print("A wild Squirtle appears!")
  }
}

printSquareRootOf(10_001)
printSquareRootOf(-1)
printSquareRootOf(55)
printSquareRootOf(25)

printCheckpoint(checkpoint: 5)

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

luckyNumbers.filter {
  !$0.isMultiple(of: 2)
}.sorted {
  $0 < $1
}.map {
  "\($0) is lucky number"
}.forEach {
  print($0)
}

printCheckpoint(checkpoint: 6)

enum GearRange: Int {
  case min = 1
  case max = 10
}

enum GearDirection: Int {
  case up = 1
  case down = -1
}

struct Car {
  let model: String
  let seatCount: Int
  let gearCount: Int
  private(set) var currentGear: Int = 1 {
    didSet {
      print("Changed gear from \(oldValue) to \(self.currentGear)")
    }
  }

  static func validateGearCount(_ gearCount: Int) -> Bool {
    if gearCount < GearRange.min.rawValue {
      print("Can't create instance: Too less gears")
      return false
    } else if gearCount > GearRange.max.rawValue {
      print("Can't create instance: Too many gears")
      return false
    } else {
      print("Engine is ready")
      return true
    }
  }

  init?(model: String, seatCount: Int, gearCount: Int = 5) {
    if !Self.validateGearCount(gearCount) {
      return nil
    }

    self.model = model
    self.seatCount = seatCount
    self.gearCount = gearCount
  }

  private func getNextGear(_ gear: GearDirection.RawValue) -> Int {
    let nextGear = self.currentGear + gear
    if nextGear > self.gearCount {
      print("There is no higer gear than \(self.currentGear)")
      return self.currentGear
    } else if nextGear < GearRange.min.rawValue {
      print("There is no lower gear than \(self.currentGear)")
      return self.currentGear
    } else {
      return nextGear
    }
  }

  mutating func setCurrentGear(_ direction: GearDirection) {
    if self.currentGear == self.getNextGear(direction.rawValue) {
      print("Gear not changed")
    } else {
      self.currentGear = self.getNextGear(direction.rawValue)
    }
  }
}

var batmobil = Car(model: "Batley", seatCount: 2, gearCount: 12)
var porsche = Car(model: "911", seatCount: 2, gearCount: 6)
var foot = Car(model: "Foo", seatCount: 0, gearCount: -1)

porsche?.setCurrentGear(.up)
porsche?.setCurrentGear(.up)
porsche?.setCurrentGear(.up)
porsche?.setCurrentGear(.up)
porsche?.setCurrentGear(.up)
porsche?.setCurrentGear(.up)
porsche?.setCurrentGear(.down)
porsche?.setCurrentGear(.down)
porsche?.setCurrentGear(.up)
porsche?.setCurrentGear(.up)
porsche?.setCurrentGear(.up)
