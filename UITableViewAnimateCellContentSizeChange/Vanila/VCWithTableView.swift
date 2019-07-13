//
//  VCWithTableView.swift
//  UITableViewAnimateCellContentSizeChange
//
//  Created by Rotem walzer on 13.7.2019.
//  Copyright © 2019 Rotem walzer. All rights reserved.
//

import UIKit

class VCWithTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // set Delegates
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCustomCell")!
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let changingContentTableViewCell = tableView.cellForRow(at: indexPath) as? ChangingContentTableViewCell{
           
            UIView.animate(withDuration: 3, animations: {
                
                tableView.beginUpdates()
                changingContentTableViewCell.heightConstraint.constant = 0
                tableView.endUpdates()
            }) { (finish) in
                //tableView.endUpdates()
            }
            
        }
    }
    

    
}
