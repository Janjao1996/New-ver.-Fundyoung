//
//  FundCell.swift
//  FundYoung
//
//  Created by Janjao on 18/2/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit

protocol fundCellDelegate{
    func DidTapAdd(fund: Fund)
    
    
}

class FundCell: UITableViewCell {
  
    
    @IBOutlet weak var FundName: UILabel!
    @IBOutlet weak var FundRisk: UILabel!
    @IBOutlet weak var FundReturn: UILabel!
    var delegate: fundCellDelegate?
    var fund:Fund!
    

    func updateViews(fund: Fund){
        FundName.text = fund.name
        FundRisk.text = String(fund.risk)
       
        
    }

    @IBAction func AddPressed(_ sender: UIButton) {
        delegate?.DidTapAdd(fund: fund)
    }
    
    
    
    
   

}
