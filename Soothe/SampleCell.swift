//
//  SampleCell.swift
//  Soothe
//
//  Created by admin on 5/13/16.
//  Copyright © 2016 Gale. All rights reserved.
//

import UIKit

class SampleCell: UITableViewCell {

    class func reuseIdentifier() -> String {
        return "SampleCellReuseIdentifier";
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
