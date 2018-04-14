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
        return FundDataService.instance.getFundsByTypes(type: fundtype).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let fundCell = tableView.dequeueReusableCell(withIdentifier: "FundCell") as? FundCell{
            let fund = FundDataService.instance.getFundsByTypes(type: fundtype)[indexPath.row ]
            fundCell.updateViews(fund: fund)
            return fundCell
            
        }
        else{
            return FundCell()
        }
        
    }
    var fundtype: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        FundTable.dataSource = self
        FundTable.delegate = self

      
    }
    func getType(type: String){
        fundtype = type
    }
    
   
}
