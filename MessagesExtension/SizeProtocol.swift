//
//  SizeProtocol.swift
//  BandC
//
//  Created by Ivan Trofimov on 23.01.17.
//  Copyright © 2017 Ivan Trofimov. All rights reserved.
//

import Foundation
import UIKit

protocol SizeProtocol {
    var TotalWidth          : CGFloat {get}
    var ElementInterval     : CGFloat {get}

    var ButtonHeight        : CGFloat {get}
    var RateHeight          : CGFloat {get}
    var NumbersHeight       : CGFloat {get}
    var PortRatesHeight     : CGFloat {get}
    var DeltaLand           : CGFloat {get}
    
    /*\
     * Non unicum variables :)
    \*/
    var LandRatesHeight     : CGFloat {get} // RateHeight + ElementInterval + NumbersHeight
}
