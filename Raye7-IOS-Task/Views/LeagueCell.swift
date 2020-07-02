//
//  LeagueCell.swift
//  Raye7-IOS-Task
//
//  Created by Hossam Elbahrawy on 7/2/20.
//  Copyright © 2020 Hossam Elbahrawy. All rights reserved.
//

import UIKit

class LeagueCell: UITableViewCell {

    @IBOutlet weak var leagueNameLable: UILabel!
    @IBOutlet weak var leagueSportLable: UILabel!
    @IBOutlet weak var leagueShortNameLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setCellData(name: String?, sport: String?, shortName:String?)  {
        self.leagueNameLable.text = name
        self.leagueSportLable.text = sport
        self.leagueShortNameLable.text = shortName
    }
}
