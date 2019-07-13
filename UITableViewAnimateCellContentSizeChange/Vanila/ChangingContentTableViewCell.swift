//
//  ChangingContentTableViewCell.swift
//  UITableViewAnimateCellContentSizeChange
//
//  Created by Rotem walzer on 13.7.2019.
//  Copyright © 2019 Rotem walzer. All rights reserved.
//

import UIKit

class ChangingContentTableViewCell: UITableViewCell {

    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
