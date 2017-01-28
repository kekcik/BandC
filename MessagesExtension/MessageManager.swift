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

func maskImage(image: UIImage, withMask maskImage: UIImage) -> UIImage {
    
    let maskRef = maskImage.cgImage!
    
    let mask = CGImage(
        maskWidth: maskRef.width,
        height: maskRef.height,
        bitsPerComponent: maskRef.bitsPerComponent,
        bitsPerPixel: maskRef.bitsPerPixel,
        bytesPerRow: maskRef.bytesPerRow,
        provider: maskRef.dataProvider!,
        decode: nil,
        
        shouldInterpolate: false)
    
    let masked = image.cgImage!.masking(mask!)
    let maskedImage = UIImage(cgImage: masked!)
    
    // No need to release. Core Foundation objects are automatically memory managed.
    
    return maskedImage
    
}

class MessageManager {
    static func sendTest(conversation : MSConversation) {
        let session = conversation.selectedMessage?.session ?? MSSession()
        let layout = MSMessageTemplateLayout()
        let message = MSMessage(session: session)
        layout.caption = "Тестовое сообщение"
        //message.url = GameManager.urlData()
        
        let imageA = UIImage(named:"num1.png")!
        let imageB = #imageLiteral(resourceName: "num1")
        
        let maskedImage: UIImage = maskImage(image: imageA, withMask: imageB)
        
    
        layout.image = maskedImage
        message.layout = layout

        
        
        UIGraphicsEndImageContext()
        message.shouldExpire = false
        conversation.insert(message)
    }
}
