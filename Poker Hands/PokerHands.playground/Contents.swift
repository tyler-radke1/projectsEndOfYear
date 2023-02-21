import UIKit
import Foundation

/// determineWinner will take in an array of "Poker" hands and determine which hand is better (according to texas holdem rules).
/// Traditionally in Texas Holdem you are only given 2 cards and then 5 other cards are placed flipped up in front of everyone.
/// In our version each player is given 5 cards with no cards placed on the table.
/// Based on just the 5 cards given in a hand. You are to determine what type of winning hands a player has and which is best.
/// For example a player may have a 2 of a kind and a 3 of a kind in a single hand. 3 of a kind is better than 2 of a kind and should be used to determine if their hand is better than any of the other players hands.
///
/// - Returns: Hand - Which is the hand that won. It is expected that the handType property("2 of a kind", "3 of a kind", "4 of a kind", etc) will have a value when returning the winning hand.
///


enum Suit: CaseIterable {
    case spades, clubs, hearts, diamonds
}

enum PlayingCardValue: Int, CaseIterable {
    case one = 1, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace
}

enum HandType: Int, Comparable {
    static func < (lhs: HandType, rhs: HandType) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
    case RoyalFlush = 0
    case StraightFlush
    case FourOfAKind
    case FullHouse
    case Flush
    case Straight
    case ThreeOfAKind
    case TwoPair
    case Pair
    case High
}

struct Card: Comparable {
    var suit: Suit
    var value: PlayingCardValue
    
    static func < (lhs: Card, rhs: Card) -> Bool {
        lhs.value.rawValue < rhs.value.rawValue
    }
}

struct Hand {
    let cards: [Card]
    var handType: HandType = .High // Bonus points for changing from a string to a custom enum of all the winningHands
    
   
    
    init?(cards: [Card]) {
        guard cards.count == 5 else { return nil }
        self.cards = cards
        self.handType = getHandType()!
    }
    
    
    private func getHandType() -> HandType? {
        var hands: [HandType?] = []
        var handsValues: [Int] = []

      //  Each call appends either nil or the respesctive handType if found
        hands.append(isFlush())
        hands.append(isStraight())
        hands.append(ofAKind())

        //Filters array to have only hands contained
        hands.filter({ $0 != nil }).forEach({ handsValues.append($0!.rawValue)})
        

        //Sorts array to return the best hand
        return HandType(rawValue: handsValues.sorted()[0])
    }



    private func isFlush() -> HandType? {
        //Checks if the card is flush
        
        //Then checks for all flush hands, so returns flush, straight flush , or royal flush
        guard cards.allSatisfy({ $0.suit == cards.first?.suit}) else { return nil}
        let values = cards.map( { $0.value.rawValue })


        let straightCheck = isStraight()

        if straightCheck != nil {
            let valuesCheck = values.sorted() == [10,11,12,13,14]
            return valuesCheck ? .RoyalFlush : .StraightFlush
        }


        return .Flush
    }


    private func isStraight() -> HandType? {
        var sortedCards = cards.sorted()

        for (index, card) in sortedCards.enumerated() {
            guard index >= 1 else { continue }

            //Iterates through hand, if value is not in sequence, breaks the loop and returns nil
            let value = card.value.rawValue
            let previousValue = sortedCards[index - 1].value.rawValue

            if value != previousValue + 1 {
                return nil
            }

        }
        return .Straight
    }

    private func ofAKind() -> HandType? {
        //returns highest amount in a pair
        // Ex: In a 5,6,6,7,9 hand, returns 2

        // [Card Number: How many]
        var values: [Int: Int] = [:]

        cards.forEach({ values[$0.value.rawValue] = 0})
        // Creates a dictionary entry for each value in the hand and sets to 0


        for card in cards {
            values[card.value.rawValue]! += 1
        }
        var numOfPairs = 0

        //Goes through each value and adds one to the pair total.
        values.forEach( { if $0.value > 1 { numOfPairs += 1 }})

        //Switches over the largest value, being the grouping size.
        switch values.values.sorted(by: >)[0] {
        case 1:
            return HandType.High
        case 2:
            return numOfPairs == 1 ? HandType.Pair : .TwoPair
        case 3:
            return (fullHouse()) ?  .FullHouse : .ThreeOfAKind
        case 4:
            return HandType.FourOfAKind
        default:
            return nil
        }
    }


    private func fullHouse() -> Bool {
        /*
         If the 3 of a kind is lower, in a sorted array it will be first.

         fullHouse of 2,2,3,3,3 vs fullHouse of 2,2,2,3,3

         so you need a check for a full house with 3 low and 2 high, or 2 low and 3 high


         */

        let theCards = cards.sorted()

        //Check for a L,L,L,H,H full house
        let firstThreeAreSame = theCards[0].value == theCards[1].value && theCards[0].value == theCards[2].value
        let lastTwoAreSame = theCards[3].value == theCards[4].value
        let lowerCheck = firstThreeAreSame && lastTwoAreSame
        print("Lower check - \(lowerCheck)")

        //Check for a L,L,H,H,H Full House
        let lastThreeAreSame = theCards[3].value == theCards[4].value && theCards[3].value == theCards[4].value
        let firstTwoAreSame = theCards[0].value == theCards[1].value
        let higherCheck = firstTwoAreSame && lastThreeAreSame

        return lowerCheck || higherCheck ? true : false

    }

    
    
    
}



func determineWinner(hands: [Hand]) -> Hand {
    var handToCompare = hands.first
    
    for hand in hands {
        
        if hand.handType.rawValue < (handToCompare?.handType.rawValue)! {
            handToCompare = hand
        }
        
    }
    
    return handToCompare!

}

let firstCard = Card(suit: .clubs, value: .nine)
let secondCard = Card(suit: .spades, value: .nine)
let thirdCard = Card(suit: .clubs, value: .three)
let fourthCard = Card(suit: .diamonds, value: .queen)
let fifthCard = Card(suit: .clubs, value: .king)

let firstHand: Hand = Hand(cards: [firstCard,secondCard,thirdCard,fourthCard,fifthCard])!

let cardOne = Card(suit: .diamonds, value: .queen)
let cardTwo = Card(suit: .hearts, value: .queen)
let cardThree = Card(suit: .clubs, value: .queen)
let cardFour = Card(suit: .spades, value: .two)
let cardFive = Card(suit: .diamonds, value: .two)

let secondHand: Hand = Hand(cards: [cardOne, cardTwo, cardThree, cardFour, cardFive])!


determineWinner(hands: [firstHand, secondHand])
