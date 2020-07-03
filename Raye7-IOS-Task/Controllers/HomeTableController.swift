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
    var leagues = [League]()
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewDidLoad() {
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
        
        let name = leagues[indexPath.row].name
        let sport = leagues[indexPath.row].sport
        let shortName = leagues[indexPath.row].shortName
        cell.setCellData(name: name, sport: sport, shortName: shortName )
        return cell
    }
}
//MARK: - HomeViewDelegate Functions
extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let leagueId = leagues[indexPath.row].id
        gotToLeagueDetails(leagueId: leagueId)
    }
}

//MARK: - Private Functions
extension HomeViewController{
    
    private func registerCustomCells(){
        let leagueCellNib = UINib(nibName: "LeagueCell", bundle: nil)
        leaguesTableView.register(leagueCellNib, forCellReuseIdentifier: "LeagueCell")
    }
    
    private func getLeagues(){
        let leagues = RealmManager.readLeagues()
        if leagues.isEmpty{
            getLeaguesFromAPI()
        }else{
            self.leagues = leagues
            self.leaguesTableView.reloadData()
        }
    }
    
    private func getLeaguesFromAPI(){
        LeaguesRequests.getLeagues{ result in
            switch result{
            case .success(let data):
                self.leagues = data
                // Save the fetched data to the database
                RealmManager.saveLeagues(leagues: data)
                //Reload the Data source to show the new data
                self.leaguesTableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    private func gotToLeagueDetails(leagueId: String){
        // get the league details VC
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let leagueDetailsVC = storyboard.instantiateViewController(identifier: "LeagueDetailsViewController") as! LeagueDetailsViewController
        //Customize the VC
        leagueDetailsVC.leagueId = leagueId
        leagueDetailsVC.modalPresentationStyle = .fullScreen
        
        //Push the view controller to the navigation controller
        self.navigationController?.pushViewController(leagueDetailsVC, animated: true)
    }
    
}
