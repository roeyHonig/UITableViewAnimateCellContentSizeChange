//
//  HeaderCellViewModel.swift
//  UITableViewAnimateCellContentSizeChange
//
//  Created by Rotem walzer on 13.7.2019.
//  Copyright © 2019 Rotem walzer. All rights reserved.
//

import UIKit

class HeaderCellViewModel: TableCellBaseViewModel {
   
    var changingContentHeightConstraintConstant: CGFloat?
    
    var showContent: Bool?
    
    var isToggeling: Bool?
    
    var tableView: UITableView?
    
    func setInitialData() {
        if changingContentHeightConstraintConstant == nil {
            changingContentHeightConstraintConstant = 240
        }
        
        if showContent == nil {
            showContent = true
        }
        
        if isToggeling == nil {
            isToggeling = false
        }
        
    }
   
    func getMyCellType() -> TableViewCellType {
        return .header
    }
    
    

}
