//
//  LeagueDetailsViewController.swift
//  Raye7-IOS-Task
//
//  Created by Hossam Elbahrawy on 7/2/20.
//  Copyright © 2020 Hossam Elbahrawy. All rights reserved.
//


import UIKit

class LeagueDetailsViewController: UIViewController {
    
    @IBOutlet var leagueDetailsView: LeagueDetailsView!
    var leagueId:String = ""
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    override func viewDidLoad() {
        getLeagueDetails()
    }
    
    
}

//MARK: - Private Functions
extension LeagueDetailsViewController{
    
    private func getLeagueDetails(){
        
        LeaguesRequests.getLeagueDetails(id: leagueId, { result in
            switch result{
            case .success(let data):
                self.leagueDetailsView.setLeagueDetailsData(LeaguDetails: data )
                
            case .failure(let error):
                print(error)
            }
        })
        
    }
}
