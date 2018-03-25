//
//  fundSelectionVC.swift
//  FundYoung
//
//  Created by Janjao on 17/2/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit

class fundSelectionVC: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    @IBOutlet weak var FundTable: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FundDataService.instance.getFunds().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let fundCell = tableView.dequeueReusableCell(withIdentifier: "FundCell") as? FundCell{
            let fund = FundDataService.instance.getFunds()[indexPath.row ]
            fundCell.updateViews(fund: fund)
            return fundCell
            
        }
        else{
            print("fail")
            return FundCell()
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        FundTable.dataSource = self
        FundTable.delegate = self

      
    }
    

   
}
