//
//  StickersListVC.swift
//  BandC
//
//  Created by Ivan Trofimov on 29.01.17.
//  Copyright © 2017 Ivan Trofimov. All rights reserved.
//

import Foundation
import UIKit
import Messages

let stickerNames = ["st1", "st2", "st3", "st4", "st5", "st6", "st7", "st8", "st9", "st10", "st11",
"st12", "st13", "st14", "st15", "st16", "st17", "st18", "st19"]

class StickersViewController: MSStickerBrowserViewController {
    var stickers = [MSSticker]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("start loading")
        loadStickers()
    }
    
    func loadStickers() {
        stickers = stickerNames.map({ name in
            let url = Bundle.main.url(forResource: name, withExtension: "png")!
            return try! MSSticker(contentsOfFileURL: url, localizedDescription: name)
        })
    }
}

extension StickersViewController {
    override func numberOfStickers(in stickerBrowserView: MSStickerBrowserView) -> Int {
        print(stickers.count)
        return stickers.count
    }
    override func stickerBrowserView(_ stickerBrowserView: MSStickerBrowserView, stickerAt index: Int) -> MSSticker {
        return stickers[index]
    }
}
