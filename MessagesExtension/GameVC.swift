//
//  GameVC.swift
//  BandC
//
//  Created by Ivan Trofimov on 15.01.17.
//  Copyright © 2017 Ivan Trofimov. All rights reserved.
//

import UIKit
import Messages

class GameVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var conversation : MSConversation?
    static let storyboardIdentifier = "GameViewController"

    @IBOutlet weak var leftC: NSLayoutConstraint!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var ratesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ratesTableView.register(UINib(nibName: "RateTableViewCell",  bundle: nil), forCellReuseIdentifier: "RCell")
        print("viewDidLoad")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(_: animated)
        print("viewWillAppear")
    }
    
    @IBAction func setSize(_ sender: UIButton) {
        let parentVC = parent as! MessagesVC
        MessageManager.sendTest(conversation: conversation!)
        parentVC.setCompactPresentationStyle()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")

        //self.view.layoutIfNeeded()
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

extension GameVC {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ratesTableView.dequeueReusableCell(withIdentifier: "RCell", for: indexPath) as! RateTableViewCell
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
