//
//  PresetsGameExtension.swift
//  BandC
//
//  Created by Ivan Trofimov on 22.01.17.
//  Copyright © 2017 Ivan Trofimov. All rights reserved.
//

import Foundation
import UIKit

extension GameVC {
    private func  setSizes(size: SizeProtocol) {
        for width in widths {
            width.constant = size.TotalWidth
        }
        tableHeight.constant = isPortrait ? size.PortRatesHeight : size.LandRatesHeight
        statusHeight.constant       = size.ButtonHeight
        buttonHeight.constant       = size.ButtonHeight
        rateHeight.constant         = size.RateHeight
        numbersHeight.constant      = size.NumbersHeight
        for i in intervals {
            i.constant = size.ElementInterval
        }
    }
    private func setPosition(size: SizeProtocol) {
        if isPortrait {
            buttonViewTop.constant      = size.ElementInterval
            tableViewTop.constant       = size.ElementInterval
            statusViewCentral.constant  = 0
            buttonViewCentral.constant  = 0
            rateViewCentral.constant    = 0
            numbersViewCentral.constant = 0
            tableViewCentral.constant   = 0
        } else {
            buttonViewTop.constant      = -size.ButtonHeight
            tableViewTop.constant       = -size.LandRatesHeight
            
            statusViewCentral.constant  = size.DeltaLand
            buttonViewCentral.constant  = -size.DeltaLand
            rateViewCentral.constant    = -size.DeltaLand
            numbersViewCentral.constant = -size.DeltaLand
            tableViewCentral.constant   = size.DeltaLand
        }
    }
    func setOrientationAndSizes(firstCall: Bool) {
        print("set sizes for height \(view.frame.height); width \(view.frame.width); firstCall \(firstCall)")
        if (view.frame.height > view.frame.width && firstCall) ||
            (view.frame.height < view.frame.width && !firstCall){
            isPortrait = true
        } else {
            isPortrait = false
        }
        
        let size = SizeHelper.init(frame: view.frame).s
        setSizes(size: size)
        setPosition(size: size)
    }
    func setColors() {
        for rate in rates {
            rate.backgroundColor = UIColor.white
        }
        for number in numbers {
            number.backgroundColor = UIColor.white
        }
        status.backgroundColor = UIColor.white
        mainButton.backgroundColor = UIColor.white
        status.textColor = UIColor.gray
        mainButton.setTitleColor(UIColor.gray, for: UIControlState.selected)
    }
}
