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
            let plan = planList[indexPath.row]
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
    
    
   
    var planList = [Plan]()
    @IBOutlet weak var menuBtn: UIButton!
    
    var activityIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //FundDataService.instance.requestAllFundData()
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = .gray
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
        PlanDataService.instance.requestPlan { (list) in
            for x in list{
                self.planList.append(x)
                self.PlanTable.reloadData()
               
            }
            if self.planList.count == 0{
                self.PlanTable.isHidden = true
                self.guidLineLbl.text = "Start your first Goal ^"
                UIApplication.shared.endIgnoringInteractionEvents()
                self.activityIndicator.stopAnimating()
                
            }
            else{
                
                self.guidLineLbl.isHidden = true
                self.PlanTable.isHidden = false
                self.PlanTable.dataSource = self
                self.PlanTable.delegate = self
                UIApplication.shared.endIgnoringInteractionEvents()
                self.activityIndicator.stopAnimating()
                
            }

            
            
            
        }
       
       
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return planList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "plancell") as? planTableCell {
                let plan = planList[indexPath.row]
                cell.updateView(plan: plan)
                return  cell
        }
        else{
            print("fail")
            return planTableCell()
        }
    }
    
    @IBAction func unwindFromIdetifyingVC(unwindSegue : UIStoryboardSegue){
        
    }
    @IBAction func unwindFromRebalanceVC(unwindSegue : UIStoryboardSegue){
        PlanTable.reloadData()
        
    }
    

}


