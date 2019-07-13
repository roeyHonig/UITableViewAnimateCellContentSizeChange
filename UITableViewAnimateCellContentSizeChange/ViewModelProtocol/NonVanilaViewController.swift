//
//  NonVanilaViewController.swift
//  UITableViewAnimateCellContentSizeChange
//
//  Created by Rotem walzer on 13.7.2019.
//  Copyright © 2019 Rotem walzer. All rights reserved.
//

import UIKit

class NonVanilaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    var tableViewDataSource: [TableCellBaseViewModel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // setup delegates
        tableView.dataSource = self
        tableView.delegate = self
        
        // register cells
        tableView.register(UINib(nibName: "HeaderCell", bundle: nil), forCellReuseIdentifier: "HeaderCell")
        
        // TableView Data Source
        tableViewDataSource = [HeaderCellViewModel(withTableView: tableView), HeaderCellViewModel(withTableView: tableView), HeaderCellViewModel(withTableView: tableView), HeaderCellViewModel(withTableView: tableView), HeaderCellViewModel(withTableView: tableView), HeaderCellViewModel(withTableView: tableView), HeaderCellViewModel(withTableView: tableView), HeaderCellViewModel(withTableView: tableView)]
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = getCell(forTableView: tableView, andIndexPath: indexPath)
        cell.selectionStyle = .none
        return cell
    }
    
    func getCell(forTableView tableView: UITableView, andIndexPath indexPath: IndexPath) -> UITableViewCell {
        let element = tableViewDataSource[indexPath.row]
        switch element.getMyCellType() {
        case .header:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as! HeaderCell
            cell.viewModel = (element as! HeaderCellViewModel)
            cell.fillCellData()
            return cell
        case .bottom:
            return UITableViewCell()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    
}
