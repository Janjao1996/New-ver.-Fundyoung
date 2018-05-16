//
//  fundSelectionVC.swift
//  FundYoung
//
//  Created by Janjao on 17/2/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit
import Alamofire

class fundSelectionVC: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fund = FundDataService.instance.getAllFunds()[indexPath.row]
        performSegue(withIdentifier: "fundDetail", sender: fund)
    }
    @IBAction func AddFundToPort(sender: UIButton)
    {   print("AddPressPerform segue")
        let fund = FundDataService.instance.getAllFunds()[sender.tag]
        print(fund)
        performSegue(withIdentifier: "AddFund", sender: fund)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let SelfSelectVC = segue.destination as? fundSelfPortAllocation{
            assert(sender as? Fund != nil)
            SelfSelectVC.initFund(fund: sender as! Fund)
        }
    }
    
    @IBOutlet weak var FundTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return FundDataService.instance.getAllFunds().count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let fundCell = tableView.dequeueReusableCell(withIdentifier: "FundCell") as? FundCell{
            let fund = FundDataService.instance.getAllFunds()[indexPath.row]
            fundCell.updateViews(fund: fund)
            fundCell.AddBtn.tag = indexPath.row
            fundCell.AddBtn.addTarget(self, action: #selector(fundSelectionVC.AddFundToPort), for: .touchUpInside)
            return fundCell
            
        }
        else{
            return FundCell()
        }
        
    }
   
    
    
    
    
    var activityIndicator = UIActivityIndicatorView()
    
    var fundtype: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        PlanDataService.instance.tempfundRatoList.removeAll()
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = .gray
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
        FundTable.dataSource = self
        FundTable.delegate = self
        FundDataService.instance.requestAllFundData {
            self.FundTable.reloadData()
            
            UIApplication.shared.endIgnoringInteractionEvents()
            self.activityIndicator.stopAnimating()
        }
        
        
        

      
    }
    
    func getType(type: String){
        fundtype = type
    }
    
   
}

