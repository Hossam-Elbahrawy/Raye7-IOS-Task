//
//  LeagueDetailsView.swift
//  Raye7-IOS-Task
//
//  Created by Hossam Elbahrawy on 7/2/20.
//  Copyright © 2020 Hossam Elbahrawy. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
class LeagueDetailsView: UIView {

     @IBOutlet weak var leagueLogoImage: UIImageView!
     @IBOutlet weak var leagueNameLable: UILabel!
     @IBOutlet weak var leagueSportLable: UILabel!
     @IBOutlet weak var leagueCountryLable: UILabel!
     @IBOutlet weak var leagueDescriptionText: UITextView!
    
    
    
    func setLeagueDetailsData( LeaguDetails: LeagueDetails){
        
        leagueLogoImage.kf.indicatorType = .activity
        let logoImgUrl =  URL(string: LeaguDetails.logoImg ?? "")
        self.leagueLogoImage.kf.setImage(with: logoImgUrl)
        self.leagueNameLable.text = LeaguDetails.name
        self.leagueSportLable.text = LeaguDetails.sport
        self.leagueCountryLable.text = LeaguDetails.country
        self.leagueDescriptionText.text = LeaguDetails.description
    }
}
