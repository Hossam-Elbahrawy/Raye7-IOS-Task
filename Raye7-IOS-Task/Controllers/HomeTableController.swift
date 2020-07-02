//
//  HomeListTableController.swift
//  Raye7-IOS-Task
//
//  Created by Hossam Elbahrawy on 7/2/20.
//  Copyright © 2020 Hossam Elbahrawy. All rights reserved.
//


import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var leaguesTableView: UITableView!
    var leagues:[League] = []
    override func viewDidLoad() {
        
        print("In Home Screen")
        
        registerCustomCells()
        getLeagues()
        
    }
}

// MARK: - HomeViewDataSource Functions
extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeagueCell") as! LeagueCell
        
        cell.setCellData(name: leagues[indexPath.row].name, sport: leagues[indexPath.row].shortName)
        return cell
    }
}

//MARK: - Private Functions
extension HomeViewController{
    
    private func registerCustomCells(){
        let leagueCellNib = UINib(nibName: "LeagueCell", bundle: nil)
        leaguesTableView.register(leagueCellNib, forCellReuseIdentifier: "LeagueCell")
    }
    
    private func getLeagues(){
        LeaguesRequests.getLeagues{ result in
            switch result{
            case .success(let data):
                self.leagues = data
                self.leaguesTableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
