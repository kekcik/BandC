//
//  SizeHelper.swift
//  BandC
//
//  Created by Ivan Trofimov on 22.01.17.
//  Copyright © 2017 Ivan Trofimov. All rights reserved.
//

import Foundation
import UIKit

class SizeHelper {
    let s : SizeProtocol
    init(frame: CGRect) {
        var width = frame.width
        var height = frame.height
        if width > height {swap(&width, &height)}
        switch height {
        case 1024:
            s = MiPad()
            print("detect iPad")
            break
        case 768:
            s = MiPad()
            print("detect custom iPad")
            break
        case 568:
            s = SiPhone()
            print("detect iPhone 5")
            break
        case 667:
            s = MiPhone()
            print("detect iPhone 6")
            break
        case 736:
            s = LiPhone()
            print("detect iPhone 6+")
            break
        default:
            s = LiPhone()
            print("detect unknown device -> LiPhone")
            break
        }
    }
}

class SiPhone   : SizeProtocol {
    internal var TotalWidth: CGFloat        = 270.0
    internal var ElementInterval: CGFloat   = 4.0
    internal var ButtonHeight: CGFloat      = 45.0
    internal var RateHeight: CGFloat        = 58
    internal var NumbersHeight: CGFloat     = 113.0
    internal var PortRatesHeight: CGFloat   = 175.0
    internal var LandRatesHeight: CGFloat   = 4 + 58 + 113
    internal var DeltaLand: CGFloat         = 140.0
}

class MiPhone   : SizeProtocol {
    internal var TotalWidth: CGFloat        = 300.0
    internal var ElementInterval: CGFloat   = 6.0
    internal var ButtonHeight: CGFloat      = 50.0
    internal var RateHeight: CGFloat        = 64.0
    internal var NumbersHeight: CGFloat     = 128.0
    internal var PortRatesHeight: CGFloat   = 209.0
    internal var LandRatesHeight: CGFloat   = 6.0 + 64.0 + 128.0
    internal var DeltaLand: CGFloat         = 160.0
}

class LiPhone   : SizeProtocol {
    internal var TotalWidth: CGFloat        = 320.0
    internal var ElementInterval: CGFloat   = 10.0
    internal var ButtonHeight: CGFloat      = 50.0
    internal var RateHeight: CGFloat        = 69.0
    internal var NumbersHeight: CGFloat     = 138.0
    internal var PortRatesHeight: CGFloat   = 233.0
    internal var LandRatesHeight: CGFloat   = 10.0 + 69.0 + 138.0
    internal var DeltaLand: CGFloat         = 165.0
}

class MiPad     : SizeProtocol {
    internal var TotalWidth: CGFloat        = 450.0
    internal var ElementInterval: CGFloat   = 20.0
    internal var ButtonHeight: CGFloat      = 70.0
    internal var RateHeight: CGFloat        = 90.0
    internal var NumbersHeight: CGFloat     = 180.0
    internal var PortRatesHeight: CGFloat   = 350.0
    internal var LandRatesHeight: CGFloat   = 20 + 100 + 170
    internal var DeltaLand: CGFloat         = 250.0
}

class LiPad     : SizeProtocol {
    internal var TotalWidth: CGFloat        = 300.0
    internal var ElementInterval: CGFloat   = 10.0
    internal var ButtonHeight: CGFloat      = 50.0
    internal var RateHeight: CGFloat        = 64.0
    internal var NumbersHeight: CGFloat     = 128.0
    internal var PortRatesHeight: CGFloat   = 128.0
    internal var LandRatesHeight: CGFloat   = 202.0
    internal var DeltaLand: CGFloat         = 210.0
}
