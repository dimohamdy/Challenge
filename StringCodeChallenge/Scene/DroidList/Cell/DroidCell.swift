//
//  DroidCell.swift
//  StringCodeChallenge
//
//  Created by BinaryBoy on 11/21/18.
//  Copyright © 2018 BinaryBoy. All rights reserved.
//

import UIKit

class DroidCell: UITableViewCell,ReusableCellView {

    @IBOutlet weak var droidIndexLabel: UILabel!
    
    var droid:Droid? = nil {
        didSet {
            guard let droid = droid else {
                return
            }
            droidIndexLabel.text =  "Droid Index \(droid.index)"  

        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
