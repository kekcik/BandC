//
//  GameVC.swift
//  BandC
//
//  Created by Ivan Trofimov on 15.01.17.
//  Copyright © 2017 Ivan Trofimov. All rights reserved.
//

import UIKit
import Messages

class GameVC: UIViewController, UITableViewDataSource, UITableViewDelegate{
    var conversation : MSConversation?
    static let storyboardIdentifier = "GameViewController"
    /*\
     *  Elements
    \*/
    @IBOutlet var numbers:                  Array <UIButton>!
    @IBOutlet var rates:                    Array <UIButton>!
    @IBOutlet weak var status:              UILabel!
    @IBOutlet weak var ratesTableView:      UITableView!
    @IBOutlet weak var mainButton:          UIButton!
    
    /*\
     * Constrains
     */
    @IBOutlet weak var tableViewTop:        NSLayoutConstraint!
    @IBOutlet weak var rateViewTop:         NSLayoutConstraint!
    @IBOutlet weak var tableViewCentral:    NSLayoutConstraint!
    @IBOutlet weak var numbersViewCentral:  NSLayoutConstraint!
    @IBOutlet weak var statusViewCentral:   NSLayoutConstraint!
    @IBOutlet weak var rateViewCentral:     NSLayoutConstraint!
    @IBOutlet weak var buttonViewCentral:   NSLayoutConstraint!
    @IBOutlet weak var buttonViewTop:       NSLayoutConstraint!
    
    @IBOutlet weak var statusWidth:         NSLayoutConstraint!
    @IBOutlet weak var buttonWidth:         NSLayoutConstraint!
    @IBOutlet weak var rateWidth:           NSLayoutConstraint!
    @IBOutlet weak var numbersWidth:        NSLayoutConstraint!
    @IBOutlet weak var tableWidth:          NSLayoutConstraint!
    @IBOutlet var widths:                   Array<NSLayoutConstraint>!
    
    @IBOutlet weak var buttonHeight:        NSLayoutConstraint!
    @IBOutlet weak var statusHeight:        NSLayoutConstraint!
    
    @IBOutlet weak var numbersHeight:       NSLayoutConstraint!
    @IBOutlet weak var rateHeight:          NSLayoutConstraint!
    @IBOutlet weak var tableHeight:         NSLayoutConstraint!
    
    @IBOutlet var intervals:                Array<NSLayoutConstraint>!
    /*\
     * Variables
     */
    var isPortrait = true
    
    /*\
     * Lifecycle methods
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        //setColors()
        setOrientationAndSizes(firstCall: true)
        self.view.setNeedsLayout()
        registerCells()
        print("viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(_: animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
        self.view.layoutIfNeeded()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        print("viewWillTransition")
        setOrientationAndSizes(firstCall: false)
    }
    
    /*\
     * Elements methods
     */
    @IBAction func setSize(_ sender: UIButton) {
        let parentVC = parent as! MessagesVC
        MessageManager.sendTest(conversation: conversation!)
        parentVC.setCompactPresentationStyle()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

