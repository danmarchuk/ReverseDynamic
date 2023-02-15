//
//  ReverseBrain.swift
//  Reverse
//
//  Created by Данік on 14/02/2023.
//

import Foundation

struct ReverseBrain {
    
    func customReverseTheWords(_ string: String, exclusion: String) -> String {
        // create an array of words
        var words = string.components(separatedBy: .whitespaces)
        // for every index and word in the array
        for (index, word) in words.enumerated() {
            // assign each word to a var  so we can remove or add letters to it
            var woord = word
            // create dictionaries where we'll store indormation letters and theri position
            var excludedCharDict: [Int : String.Element] = [:]
            var everyCharDict: [Int : String.Element] = [:]
            
    //        var testDict: [Int: [String.Index : String.Element]] = [:]
            // for every letter in exclusion
            for (indexOfTheChar, char) in woord.enumerated() {
    //            let everyCharIndex = woord.index(woord.startIndex, offsetBy: indexOfTheChar)
                everyCharDict[indexOfTheChar] = char
                // for every index and charater in a word
                for letter in exclusion   {
                    // if word contains a letter
                    if woord.contains(letter) {
                        // if the character of the word is the same as an exclusion
                        if char == letter {
    //                        let myIndex = woord.index(woord.startIndex, offsetBy: indexOfTheChar)
                            excludedCharDict[indexOfTheChar] = char
    //                        testDict[indexOfTheChar] = [myIndex:char]
                        }
                    } else if !woord.contains(letter) {
                        words[index] = String(woord.reversed())
                    }
                }
            }
            
            // remove excluded characters
            for (index, _) in everyCharDict {
                for (indexx, _) in excludedCharDict {
                    if index == indexx {
                        everyCharDict.removeValue(forKey: index)
                    }
                }
            }
            
            // a very "elegant" way of avoiding "String index is out of bounds Error"
            var testWord = "      "
            
            // sort every character
            let sortedArray = everyCharDict.sorted(by: { $0.0 < $1.0 })

            // put the sorted characters in the word
            for (num, char) in sortedArray {
                let myIndex = testWord.index(testWord.startIndex, offsetBy: num)
                testWord.insert(char, at: testWord.startIndex)
            }
            
            // sort excluded characters
            let sortedArr = excludedCharDict.sorted(by: { $0.0 < $1.0 })
            // put excluded characters in the word
            for (num, char) in sortedArr {
                let myIndex = testWord.index(testWord.startIndex, offsetBy: num)
                testWord.insert(char, at: myIndex)
            }
            
            // put the word back at it's place
            words[index] = String(testWord)
        }
        
        // a very "elegant" way of putting the words together
        var sentence = words.joined(separator: " ")
        var wordss = sentence.components(separatedBy: "       " )
        return wordss.joined(separator: " ")
    }
    
    func defaultReverseFunction(_ string: String) -> String {
        // create an array of words
        var words = string.components(separatedBy: .whitespaces)

        // for every index and word in the array
        for (index, word) in words.enumerated() {
            
            //If a word contains no letters - skip it
            if !word.contains(where: \.isLetter) { continue }

            // reverse the word if it only has letters
            var reversed = word.reversed().filter(\.isLetter)
            
            // for every index and charater in a word
            for (index, char) in word.enumerated() {
                
                // if the charater is not a leter
                if !char.isLetter {
                    // leave the special charater at the original place
                    reversed.insert(char, at: index)
                }
            }
            // put the reversed words in the array
            words[index] = String(reversed)
        }
        return words.joined(separator: " ")
    }
    
    
    
}
