//
//  HomeListTableController.swift
//  Raye7-IOS-Task
//
//  Created by Hossam Elbahrawy on 7/2/20.
//  Copyright © 2020 Hossam Elbahrawy. All rights reserved.
//


import UIKit

class HomeTableController: UITableViewController {
    override func viewDidLoad() {
        
        print("In Home Screen")
        
        LeaguesRequests.getLeagues{ result in
            switch result{
            case .success(let leagues):
                print(leagues.count)
            case .failure(let error):
                print(error)
            }
        }
    }
}
