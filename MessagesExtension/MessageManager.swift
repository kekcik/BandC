//
//  MessageManager.swift
//  BandC
//
//  Created by Ivan Trofimov on 18.01.17.
//  Copyright © 2017 Ivan Trofimov. All rights reserved.
//

import Foundation
import Messages

class MessageManager {
    static func sendTest(conversation : MSConversation) {
        let session = conversation.selectedMessage?.session ?? MSSession()
        let layout = MSMessageTemplateLayout()
        let message = MSMessage(session: session)
        layout.caption = "Тестовое сообщение"
        message.layout = layout
        //message.url = GameManager.urlData()
        message.shouldExpire = false
        conversation.insert(message)
    }
}
