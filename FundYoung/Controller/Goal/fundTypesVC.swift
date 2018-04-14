//
//  fundTypesVC.swift
//  FundYoung
//
//  Created by Janjao on 8/4/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit

class fundTypesVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FundDataService.instance.getTypes().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let typeCell = tableView.dequeueReusableCell(withIdentifier: "TypesCell") as? TypesCell{
            let type = FundDataService.instance.getTypes()[indexPath.row]
            typeCell.updateViews(type: type)
            return typeCell
            
            
        }
        else{
            return TypesCell()
            
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = FundDataService.instance.getTypes()[indexPath.row]
        performSegue(withIdentifier: "FundTypes", sender: type)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let typeVC = segue.destination as? fundSelectionVC{
            print("func prepare to fund type")
            assert(sender as? String != nil)
            typeVC.getType(type: sender as! String)
          
            
        }
    }

    
    @IBOutlet weak var fundTypesTable: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        fundTypesTable.delegate = self
        fundTypesTable.dataSource = self

    }

  

}
