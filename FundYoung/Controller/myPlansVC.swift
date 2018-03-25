//
//  myPlansVC.swift
//  FundYoung
//
//  Created by Janjao on 17/2/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit

class myPlansVC: UIViewController , UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == shortTermTable{
            return PlanDataService.instance.getShortTermPlan().count
        }
        else{
            return PlanDataService.instance.getLongTermPlan().count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "shortTerm") as? PlanCell {
            let plan = PlanDataService.instance.getShortTermPlan()[indexPath.row]
            cell.updateView(plan: plan)
            return  cell
         
        }
        else if let cell = tableView.dequeueReusableCell(withIdentifier: "longTerm") as? PlanCell {
            let plan = PlanDataService.instance.getLongTermPlan()[indexPath.row]
            cell.updateView(plan: plan)
            return  cell
            
        }
        else {
            
            return PlanCell()
        }
   
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let plan = PlanDataService.instance.getShortTermPlan()[indexPath.row]
        performSegue(withIdentifier: "RebanceVC", sender: plan)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let RebalanceVC = segue.destination as? RebalanceVC{
            print("func prepare")
            assert(sender as? Plan != nil)
            RebalanceVC.initPlan(plan: sender as! Plan)
            
        }
    }
    
    
    @IBOutlet weak var shortTermTable:UITableView!
    @IBOutlet weak var longTermTable:UITableView!
    
    
    
    
  


    override func viewDidLoad() {
        
        super.viewDidLoad()
        shortTermTable.dataSource = self
        longTermTable.dataSource = self
        shortTermTable.delegate = self
        longTermTable.delegate = self
      
    }
    
    
    
    @IBAction func unwindFromIdetifyingVC(unwindSegue : UIStoryboardSegue){
        
    }
    

}
