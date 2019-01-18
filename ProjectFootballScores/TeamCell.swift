//
//  TeamCell.swift
//  ProjectFootballScores
//
//  Created by Jens De Taey on 21/12/2018.
//  Copyright © 2018 Jens De Taey. All rights reserved.
//

import UIKit

class TeamCell : UITableViewCell {
   
    @IBOutlet weak var FavoriteButton: UIButton!
    @IBOutlet weak var teamNameLabel: UILabel!
    var team: Team! {
        didSet {
            teamNameLabel.text = team.name;
            if(team.isFavorite){
                FavoriteButton.tintColor = UIColor.yellow
            }else{
                FavoriteButton.tintColor = UIColor.gray
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let origImage = UIImage(named: "star_fav");
        let tintedImage = origImage?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        FavoriteButton.setImage(tintedImage, for: .normal)
        
        FavoriteButton.tintColor = UIColor.gray
        
    }
    
   
    
    @IBAction func FavoritePushed(_ sender: Any) {
        print(team.name)
        if(team.isFavorite == false){
            RealmController.singletonRealm.addTeam(team: team)
            {
                error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print("succes add")
                    self.FavoriteButton.tintColor = UIColor.yellow
                }
            }
        }else {
            print(team)
            RealmController.singletonRealm.deleteTeam(teamToDelete: team) {
                error in
                if error != nil {
                    print("failed delete")
                } else {
                    self.FavoriteButton.tintColor = UIColor.gray
                    print("succes delete")
                }
            }
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}

