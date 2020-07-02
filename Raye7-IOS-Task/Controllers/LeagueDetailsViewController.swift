//
//  LeagueDetailsViewController.swift
//  Raye7-IOS-Task
//
//  Created by Hossam Elbahrawy on 7/2/20.
//  Copyright © 2020 Hossam Elbahrawy. All rights reserved.
//


import UIKit

class LeagueDetailsViewController: UIViewController {
    
    var leagueDetails = LeagueDetails()
    var leagueId:String = ""
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    override func viewDidLoad() {
        print("In League Details View Controller")
        getLeagueDetails()
        print(leagueId)
    }
    
}

//MARK: - Private Functions
extension LeagueDetailsViewController{
    
    private func getLeagueDetails(){
        
        LeaguesRequests.getLeagueDetails(id: "4831", { result in
            switch result{
            case .success(let data):
                print(data)
                self.leagueDetails = data
                print(self.leagueDetails)
            case .failure(let error):
                print(error)
            }
        })
        
    }
}
