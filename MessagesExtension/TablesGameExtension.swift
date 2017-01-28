//
//  TablesGameExtension.swift
//  BandC
//
//  Created by Ivan Trofimov on 22.01.17.
//  Copyright © 2017 Ivan Trofimov. All rights reserved.
//

import UIKit

extension GameVC {
    /*\
     * Rates table view
    \*/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.ratesTableView.dequeueReusableCell(withIdentifier: "RateCell", for: indexPath) as! RateTableViewCell
        cell.rate.text = "2222"
        cell.cows.text = "0 cows"
        cell.bulls.text = "4 bulls"
        return cell
    }
    
    /*\
     * Other methods for tableView
    \*/
    func registerCells() {
        self.ratesTableView.register(UINib(nibName: "RateTableViewCell",  bundle: nil), forCellReuseIdentifier: "RateCell")
    }
}
