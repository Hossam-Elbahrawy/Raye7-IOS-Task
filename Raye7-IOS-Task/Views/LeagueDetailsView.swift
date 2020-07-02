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
     @IBOutlet weak var leagueLocationLable: UILabel!
     @IBOutlet weak var leagueDescriptionText: UITextView!
    
    
    
    func setLeagueDetailsData( logoImg: String?,name: String?,sport: String?, location: String?, description: String?){
        
        leagueLogoImage.kf.indicatorType = .activity
        let logoImgUrl =  URL(string: logoImg ?? "")
        self.leagueLogoImage.kf.setImage(with: logoImgUrl)
        self.leagueNameLable.text = name
        self.leagueSportLable.text = sport
        self.leagueLocationLable.text = location
        self.leagueDescriptionText.text = description
    }
}
