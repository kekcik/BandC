//
//  MessageManager.swift
//  BandC
//
//  Created by Ivan Trofimov on 18.01.17.
//  Copyright © 2017 Ivan Trofimov. All rights reserved.
//

import Foundation
import Messages
import ImageIO
import CoreImage

extension UIView {
    func capture() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.frame.size, self.isOpaque, UIScreen.main.scale)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

class MessageManager {
    static func getRateImage(for st: String) -> UIImage {
        var totalIV: UIImageView!
        var imageStack : [UIImageView]!
        
        let IViewA = UIImageView(image: #imageLiteral(resourceName: "num01"))
        let IViewB = UIImageView(image: #imageLiteral(resourceName: "num11"))
        let IViewC = UIImageView(image: #imageLiteral(resourceName: "num21"))
        let IViewD = UIImageView(image: #imageLiteral(resourceName: "num31"))
        totalIV = UIImageView(frame: CGRect(x: 0, y: 0, width: 424, height: 160))
        IViewA.frame = CGRect(x: 0, y: 0, width: 106, height: 160)
        IViewB.frame = CGRect(x: 106, y: 0, width: 106, height: 160)
        IViewC.frame = CGRect(x: 212, y: 0, width: 106, height: 160)
        IViewD.frame = CGRect(x: 318, y: 0, width: 106, height: 160)
        totalIV.addSubview(IViewA)
        totalIV.addSubview(IViewB)
        totalIV.addSubview(IViewC)
        totalIV.addSubview(IViewD)

        return totalIV.capture();
    }
    static func sendTest(conversation : MSConversation) {
        let session = conversation.selectedMessage?.session ?? MSSession()
        let layout = MSMessageTemplateLayout()
        let message = MSMessage(session: session)
        layout.caption = "Как тебе такой ход?"
        //message.url = GameManager.urlData()
        
        
        //view.addSubview(bgImage)
        let image = getRateImage(for: "1234")
        
        //let maskedImage: UIImage = maskImage(image: imageA, withMask: imageB)
        
        //layout.image = maskedImage
        layout.image = image
        message.layout = layout
        
        UIGraphicsEndImageContext()
        message.shouldExpire = false
        conversation.insert(message)
    }
    
    static func SendRequestMessage (conversation: MSConversation) {
        let session = conversation.selectedMessage?.session ?? MSSession()
        let layout = MSMessageTemplateLayout()
        let message = MSMessage(session: session)
        layout.caption = "Не хочешь сыграть со мной в одну игру?"
        message.layout = layout
        message.url = GameManager.urlData()
        message.shouldExpire = false
        conversation.insert(message)
    }
    static func SendConfirmMessage(conversation : MSConversation) {
        let session = conversation.selectedMessage?.session ?? MSSession()
        let layout = MSMessageTemplateLayout()
        let message = MSMessage(session: session)
        layout.caption = "Сразимся! Начинай."
        message.layout = layout
        message.url = GameManager.urlData()
        message.shouldExpire = false
        conversation.insert(message)
    }
    static func SendRateMessage(conversation: MSConversation) {
        let session = conversation.selectedMessage?.session ?? MSSession()
        let layout = MSMessageTemplateLayout()
        let message = MSMessage(session: session)
        let result = GameManager.GameResult()
        layout.caption = "Мой ход на \(result.0). Попал?"
        message.layout = layout
        message.url = GameManager.urlData()
        message.shouldExpire = false
        conversation.insert(message)
    }
    static func SendFinishMessage(conversation: MSConversation) {
        let session = conversation.selectedMessage?.session ?? MSSession()
        let layout = MSMessageTemplateLayout()
        let message = MSMessage(session: session)
        layout.caption = "Упс :( \nты победил, похоже"
        message.layout = layout
        message.url = GameManager.urlData()
        message.shouldExpire = false
        conversation.insert(message)
    }

}
