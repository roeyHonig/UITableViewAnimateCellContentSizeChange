//
//  TableCellBaseViewModel.swift
//  UITableViewAnimateCellContentSizeChange
//
//  Created by Rotem walzer on 13.7.2019.
//  Copyright © 2019 Rotem walzer. All rights reserved.
//

import Foundation
import UIKit

protocol TableCellBaseViewModel {
    
    var showContent: Bool {get set}
    var isToggeling: Bool {get set}
    var tableView: UITableView {get set}
    
    func getMyCellType() -> TableViewCellType
    func getToggelingDuration() -> TimeInterval
}

