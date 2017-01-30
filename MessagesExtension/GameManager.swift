//
//  GameManager.swift
//  BandC
//
//  Created by Ivan Trofimov on 29.01.17.
//  Copyright © 2017 Ivan Trofimov. All rights reserved.
//

import Foundation
import Messages

class GameManager {
    /*\
     0 -- новая игра
     1 -- предложение игры
     2 -- ход первого
     3 -- ход второго
     4 -- победа первогои
     5 -- победа второго
     6 -- кто-то мухлюет
     */
    static var status       = 0
    static var firstNumber  = ""
    static var secondNumber = ""
    static var firstRates   = ""
    static var secondRates  = ""
    static var firstUUID    = ""
    static var secondUUID   = ""
    
    /*\
     This varibles are not transmit
     */
    static var newRate              = ""
    static var firstRatesParsed     = [String]()   //need to delete
    static var secondRatesParsed    = [String]()   //need to delete
    static var ratesParsed          = [String]()
    static var conversation         = MSConversation.init()
    
    /*\
     * Methods
     *
     * NOTE: You should call UpdateParams
     */
    static func UpdateParams(conversation: MSConversation) {
        self.conversation       = conversation
        self.status             = 0
        print("update")
        if conversation.selectedMessage?.url == nil {return;}
        print("finish")
        print("\(conversation.selectedMessage?.url!)")
        let queryItems          = URLComponents(string: (conversation.selectedMessage?.url?.absoluteString)!)?.queryItems
        self.status             = Int((queryItems?.filter({$0.name == "st" as String}).first?.value)!)!
        self.firstNumber        = (queryItems?.filter({$0.name == "fn" as String}).first?.value)!
        self.secondNumber       = (queryItems?.filter({$0.name == "sn" as String}).first?.value)!
        self.firstRates         = (queryItems?.filter({$0.name == "fr" as String}).first?.value)!
        self.secondRates        = (queryItems?.filter({$0.name == "sr" as String}).first?.value)!
        self.firstUUID          = (queryItems?.filter({$0.name == "fi" as String}).first?.value)!
        self.secondUUID         = (queryItems?.filter({$0.name == "si" as String}).first?.value)!
        self.firstRatesParsed   = ParseRates(str: self.firstRates)
        self.secondRatesParsed  = ParseRates(str: self.secondRates)
        self.ratesParsed        = self.secondUUID == conversation.localParticipantIdentifier.uuidString ? self.firstRatesParsed : self.secondRatesParsed
    }
    
    static func ParseRates(str: String) -> [String] {
        var stack = [String]()
        var cur = ""
        for ch in str.characters {
            cur += String(ch)
            if cur.characters.count == 4 {
                stack += [cur]
                cur = ""
            }
        }
        return stack;
    }
    
    static func addRate(step: String, uuid: String) {
        newRate = step
        if firstUUID == uuid {
            secondRates += step;
        } else if secondUUID == uuid {
            firstRates += step
        } else {
            status = 6
        }
    }
    
    static func calculateResult(rate: String, reference: String) -> (Int, Int) {
        var bulls = 0
        var cows = 0
        for ai in rate.characters {
            for aj in reference.characters {
                if Int(String(ai))! == Int(String(aj))! {
                    cows += 1
                }
            }
        }
        var rate = (Int)(rate)!
        var reference = (Int)(reference)!
        for _ in 0...3 {
            if (rate % 10) == (reference % 10) {
                cows -= 1
                bulls += 1
            }
            rate /= 10
            reference /= 10
        }
        return (cows, bulls)
    }
    
    static func urlData () -> URL {
        let str = "http://trofimov.mobi/game?" +
            "st=\(GameManager.status)&" +
            "fn=\(GameManager.firstNumber)&" +
            "sn=\(GameManager.secondNumber)&" +
            "fr=\(GameManager.firstRates)&" +
            "sr=\(GameManager.secondRates)&" +
            "fi=\(GameManager.firstUUID)&" +
        "si=\(GameManager.secondUUID)"
        let u = URL(string: str)
        return u!
    }
    
    static func GameResult () -> (String, Int, Int) {
        return (newRate, -1, -1)
    }
    
    static func startGame() {
        status = 1
        firstUUID = conversation.localParticipantIdentifier.uuidString
        MessageManager.SendRequestMessage(conversation: conversation)
    }
    
    static func confirmGame() {
        status = 2
        secondUUID = conversation.localParticipantIdentifier.uuidString
        MessageManager.SendConfirmMessage(conversation: conversation)
    }
    
    static func makeRate() {
        status = status == 2 ? 3 : 2
        MessageManager.SendRateMessage(conversation: conversation)
    }

    
}
