//
//  HeaderCell.swift
//  UITableViewAnimateCellContentSizeChange
//
//  Created by Rotem walzer on 13.7.2019.
//  Copyright © 2019 Rotem walzer. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {
    
    @IBOutlet weak var arrowImage: UIImageView!
    @IBOutlet weak var animatingView: UIView!
    @IBOutlet weak var animatingViewHeightConstraint: NSLayoutConstraint!
    var viewModel: HeaderCellViewModel!
    
    func toggleContent() {
        print("toggleing")
        viewModel.isToggeling = true
        let animationDuration = viewModel.getToggelingDuration()
        if viewModel.showContent {
            // animate to close
            self.animatingViewHeightConstraint.constant = 20
            
            self.viewModel.tableView.beginUpdates()
            
            UIView.animate(withDuration: animationDuration, animations: {
                let transform = CGAffineTransform(rotationAngle: CGFloat.pi * 0.99)
                self.arrowImage.transform = transform
            }) { (finish) in
                self.viewModel.isToggeling = false
                self.viewModel.showContent = false
                self.viewModel.changingContentHeightConstraintConstant = 20
                self.viewModel.arrowImagaeRotationAngle =  CGFloat.pi * 0.99
            }
            
            self.viewModel.tableView.endUpdates()
            
           
        } else {
            // animate to open
            self.animatingViewHeightConstraint.constant = 240
            
            self.viewModel.tableView.beginUpdates()
            
            UIView.animate(withDuration: animationDuration, animations: {
                let transform = CGAffineTransform(rotationAngle: CGFloat.pi * 0)
                self.arrowImage.transform = transform
            }) { (finish) in
                self.viewModel.isToggeling = false
                self.viewModel.showContent = true
                self.viewModel.changingContentHeightConstraintConstant = 240
                self.viewModel.arrowImagaeRotationAngle =  CGFloat.pi * 0
            }
            
            self.viewModel.tableView.endUpdates()
            
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
        animatingViewHeightConstraint.constant = viewModel.changingContentHeightConstraintConstant
        let transform = CGAffineTransform(rotationAngle: viewModel.arrowImagaeRotationAngle)
        arrowImage.transform = transform
    }
    
    @objc func animatingViewWasTapped() {
        print("view was pressed")
        if !viewModel.isToggeling {
            toggleContent()
        }
 
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
