//
//  SettingsTableVC.swift
//  WhatsAppClone
//
//  Created by Puspank Kumar on 21/01/19.
//  Copyright © 2019 Puspank Kumar. All rights reserved.
//

import UIKit

class SettingsTableVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true

    }

    // MARK: - Table view data source
  
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    
    
    
    // IBActions
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        
        FUser.logOutCurrentUser { (success) in
            
            if success {
                
                self.showLoginScreen()
            }
        }
    }
    
    
    func showLoginScreen()  {
        
        let mainView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Welcome")
        self.present(mainView, animated: true, completion: nil)
    }

}
