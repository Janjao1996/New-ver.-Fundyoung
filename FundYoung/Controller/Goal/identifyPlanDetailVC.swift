import UIKit

class identifyPlanDetailVC: UIViewController {
    
    
    @IBOutlet weak var targetInput: UITextView!
    
    @IBOutlet weak var NextBtn: DarkGreyBtnBorder!
    
    var targetPlan: Int!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let doneBtn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        doneBtn.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        doneBtn.setTitle("Done", for: .normal)
        doneBtn.setTitleColor(#colorLiteral(red: 0.4352941176, green: 0.4431372549, blue: 0.4745098039, alpha: 1), for: .normal)
        doneBtn.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        doneBtn.layer.borderWidth = 0.5
        doneBtn.addTarget(self, action: #selector(identifyPlanDetailVC.done), for: .touchUpInside)
        
        targetInput.inputAccessoryView = doneBtn
        
        
        
    }
    
    @objc func done() {
        NextBtn.isEnabled = true
        if let targetInput = targetInput.text{
            if let target = Int(targetInput){
                PlanDataService.instance.TemperarydPlan.Target = target
                
                view.endEditing(true)
            }
        }
      
    }
    
    
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "DurationVC", sender: self)
        
    }
        
    /*
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let risk = segue.destination as? DurationVC{
            let plan = Plan(Id: 0 ,PlanName: "", Target: targetPlan, NumberOfYear:0)
            risk.plan_ = plan
            
        }
    }*/
    @IBAction func unwindFromDurationVC(unwindSegue : UIStoryboardSegue){
        
    }
    
    
    
}
