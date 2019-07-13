//
//  HeaderCellViewModel.swift
//  UITableViewAnimateCellContentSizeChange
//
//  Created by Rotem walzer on 13.7.2019.
//  Copyright © 2019 Rotem walzer. All rights reserved.
//

import UIKit

class HeaderCellViewModel: TableCellBaseViewModel {
    
    var changingContentHeightConstraintConstant: CGFloat
    var showContent: Bool
    var isToggeling: Bool
    var tableView: UITableView
    
    init(withTableView tableView: UITableView ) {
        self.tableView = tableView
        self.showContent = true
        self.isToggeling = false
        self.changingContentHeightConstraintConstant = 240
    }
    
    func getMyCellType() -> TableViewCellType {
        return .header
    }
    
    func getToggelingDuration() -> TimeInterval {
        return 3
    }
    
    
    

}
