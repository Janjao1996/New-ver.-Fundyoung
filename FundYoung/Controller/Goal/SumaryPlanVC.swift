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
    
            let plan = PlanDataService.instance.getPlans()[indexPath.row]
            performSegue(withIdentifier: "RebanceVC", sender: plan)
       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let RebalanceVC = segue.destination as? RebalanceVC{
            print("func prepare")
            assert(sender as? Plan != nil)
            RebalanceVC.initPlan(plan: sender as! Plan)
            
        }
    }
    
    

    @IBOutlet weak var guidLineLbl: UILabel!
    
    @IBOutlet weak var PlanTable:UITableView!
    
    
   
    
    @IBOutlet weak var menuBtn: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        if PlanDataService.instance.getPlans().count == 0{
            PlanTable.isHidden = true
            guidLineLbl.text = "Start you first Goal"
            
        }
        else{
            guidLineLbl.isHidden = true
            PlanTable.isHidden = false
            PlanTable.dataSource = self
            PlanTable.delegate = self
            
        }
        
       
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return PlanDataService.instance.getPlans().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "plancell") as? planTableCell {
                let plan = PlanDataService.instance.getPlans()[indexPath.row]
                cell.updateView(plan: plan)
                return  cell
        }
        else{
            print("fail")
            return planTableCell()
        }
    }
    /*
    @IBAction func switchTermAction(_ sender: UISegmentedControl) {
        PlanTable.reloadData()
        
    }
*/
    
    @IBAction func unwindFromIdetifyingVC(unwindSegue : UIStoryboardSegue){
        
    }
    @IBAction func unwindFromRebalanceVC(unwindSegue : UIStoryboardSegue){
        PlanTable.reloadData()
        
    }
    

}
