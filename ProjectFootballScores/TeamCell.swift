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
        //team.isFavorite = !team.isFavorite
        if(team.isFavorite == false){
            /*if(RealmController.singletonRealm.addTeam(team: team)){
                self.FavoriteButton.tintColor = UIColor.yellow
                
                print("succes add")
            }else{
                print("failed add")
            }*/
            RealmController.singletonRealm.addTeam(team: team)
            {
                error in
                
                if let error = error {
                    //Toaster.makeErrorToast(view: self.navigationController?.view, text: "Beer could not be added: '\(error.localizedDescription)'")
                    print(error.localizedDescription)
                } else {
                    //There were no errors
                    //Toaster.makeSuccesToast(view: self.navigationController?.view, text: "Beer succesfully added to your library")
                    print("succes add")
                    self.FavoriteButton.tintColor = UIColor.yellow
                }
                
            }
        }else {
            print(team)
            RealmController.singletonRealm.deleteTeam(teamToDelete: team) {
                error in
                
                if error != nil {
                    //self.showToast(message: "failed delete")
                    print("failed delete")
                } else {
                    //There were no errors
                    //self.showToast(message: "succes delete ")
                    
                    self.FavoriteButton.tintColor = UIColor.gray
                    print("succes delete")
                }
                
            }
        }
        //print(team.isFavorite)
        //print(RealmController.singletonRealm.teams)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

