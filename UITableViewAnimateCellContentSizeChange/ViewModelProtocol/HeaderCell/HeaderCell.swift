//
//  HeaderCell.swift
//  UITableViewAnimateCellContentSizeChange
//
//  Created by Rotem walzer on 13.7.2019.
//  Copyright © 2019 Rotem walzer. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {
    
    @IBOutlet weak var animatingView: UIView!
    @IBOutlet weak var animatingViewHeightConstraint: NSLayoutConstraint!
    var viewModel: HeaderCellViewModel!
    
    func toggleContent() {
        
        print("toggleing")
        viewModel.isToggeling = true
       
        if viewModel.showContent! {
            // animate to close
            UIView.animate(withDuration: 3, animations: {
                self.viewModel.tableView!.beginUpdates()
                self.animatingViewHeightConstraint.constant = 20
                self.viewModel.tableView!.endUpdates()
            }) { (finish) in
                self.viewModel.isToggeling = false
                self.viewModel.showContent = false
                self.viewModel.changingContentHeightConstraintConstant = 20
            }
        } else {
            // animate to open
            UIView.animate(withDuration: 3, animations: {
                self.viewModel.tableView!.beginUpdates()
                self.animatingViewHeightConstraint.constant = 240
                self.viewModel.tableView!.endUpdates()
            }) { (finish) in
                self.viewModel.isToggeling = false
                self.viewModel.showContent = true
                self.viewModel.changingContentHeightConstraintConstant = 240
            }
            
        }
        
    }
    
    func getMyCellType() -> TableViewCellType {
        return .header
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(animatingViewWasTapped))
        animatingView.addGestureRecognizer(tapGesture)
    }
    
    func fillCellData() {
        animatingViewHeightConstraint.constant = viewModel.changingContentHeightConstraintConstant!
    }
    
    @objc func animatingViewWasTapped() {
        print("view was pressed")
        if !(viewModel.isToggeling!) {
            toggleContent()
        }
 
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
