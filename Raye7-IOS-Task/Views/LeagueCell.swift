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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
    func setCellData(name: String?, sport: String?)  {
        self.leagueNameLable.text = name
        self.leagueSportLable.text = sport
    }
}
