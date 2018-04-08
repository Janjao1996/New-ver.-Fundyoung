//
//  TypesCell.swift
//  FundYoung
//
//  Created by Janjao on 8/4/2561 BE.
//  Copyright © 2561 Janjao. All rights reserved.
//

import UIKit

class TypesCell: UITableViewCell {

    @IBOutlet weak var typeLbl: UILabel!
    func updateViews(type: String){
      typeLbl.text = type
    }

}
