//
//  GameVC.swift
//  BandC
//
//  Created by Ivan Trofimov on 15.01.17.
//  Copyright © 2017 Ivan Trofimov. All rights reserved.
//

import UIKit
import Messages

class GameVC: UIViewController {
    var conversation : MSConversation?
    static let storyboardIdentifier = "GameViewController"

    @IBOutlet weak var leftC: NSLayoutConstraint!
    @IBOutlet weak var yellowButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        print("view did load")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func setSize(_ sender: UIButton) {
        let parentVC = parent as! MessagesVC
        MessageManager.sendTest(conversation: conversation!)
        parentVC.setCompactPresentationStyle()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.layoutIfNeeded()
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
