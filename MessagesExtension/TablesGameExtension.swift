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
        cell.rate.text = ["1057", "1703", "4351"][indexPath.row]
        cell.cows.text = ["0 коров", "1 корова", "2 коровы"][indexPath.row]
        cell.bulls.text = ["2 быка", "1 бык", "0 быков"][indexPath.row]
        return cell
    }
    
    /*\
     * Other methods for tableView
    \*/
    func registerCells() {
        self.ratesTableView.register(UINib(nibName: "RateTableViewCell",  bundle: nil), forCellReuseIdentifier: "RateCell")
    }
}
