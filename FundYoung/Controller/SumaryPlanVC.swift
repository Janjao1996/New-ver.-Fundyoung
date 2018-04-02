//
//  SumaryPlanVC.swift
//  FundYoung
//
//  Created by Janjao on 1/4/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit

class SumaryPlanVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch segment.selectedSegmentIndex {
        case 0:
            let plan = PlanDataService.instance.getShortTermPlan()[indexPath.row]
            performSegue(withIdentifier: "RebanceVC", sender: plan)
        case 1:
            let plan = PlanDataService.instance.getLongTermPlan()[indexPath.row]
            performSegue(withIdentifier: "RebanceVC", sender: plan)
        default:
            break
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let RebalanceVC = segue.destination as? RebalanceVC{
            print("func prepare")
            assert(sender as? Plan != nil)
            RebalanceVC.initPlan(plan: sender as! Plan)
            
        }
    }
    
    

    
    @IBOutlet weak var PlanTable:UITableView!
    
    
    @IBOutlet weak var segment: UISegmentedControl!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        PlanTable.dataSource = self
        PlanTable.delegate = self

      
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segment.selectedSegmentIndex {
        case 0:
            return PlanDataService.instance.getShortTermPlan().count
        case 1:
            return PlanDataService.instance.getLongTermPlan().count
        default:
            break
        }
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "plancell") as? planTableCell {
            switch segment.selectedSegmentIndex{
            case 0:
                let plan = PlanDataService.instance.getShortTermPlan()[indexPath.row]
                cell.updateView(plan: plan)
                return  cell
            case 1:
                let plan = PlanDataService.instance.getLongTermPlan()[indexPath.row]
                cell.updateView(plan: plan)
                return  cell
            default:
                break
            }
            return PlanCell()

        }
        else{
            return PlanCell()
        }
    }
    @IBAction func switchTermAction(_ sender: UISegmentedControl) {
        PlanTable.reloadData()
        
    }

    
    @IBAction func unwindFromIdetifyingVC(unwindSegue : UIStoryboardSegue){
        
    }
    @IBAction func unwindFromRebalanceVC(unwindSegue : UIStoryboardSegue){
        
    }
    

}
