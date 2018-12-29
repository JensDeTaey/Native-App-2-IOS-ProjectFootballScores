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
        
        
        
        //accessoryView = FavoriteButton
        
    }
    
   
    
    @IBAction func FavoritePushed(_ sender: Any) {
        print(team.name)
        team.isFavorite = !team.isFavorite
        if(team.isFavorite == true){
            RealmController.singletonRealm.addTeam(team: team) {
                error in
                
                if let error = error {
                    //self.showToast(message: "failed add")
                    print("failed add")
                } else {
                    //There were no errors
                    //self.showToast(message: "succes add")
                    print("succes add")
                }
                
            }
        }else {
            RealmController.singletonRealm.deleteTeam(team: team) {
                error in
                
                if let error = error {
                    //self.showToast(message: "failed delete")
                    print("failed delete")
                } else {
                    //There were no errors
                    //self.showToast(message: "succes delete ")
                    print("succes delete")
                }
                
            }
        }
        print(team.isFavorite)
        print(RealmController.singletonRealm.teams)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
extension UIViewController {
    
        func showToast(message : String) {
            
            let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
            toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            toastLabel.textColor = UIColor.white
            toastLabel.textAlignment = .center;
            toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
            toastLabel.text = message
            toastLabel.alpha = 1.0
            toastLabel.layer.cornerRadius = 10;
            toastLabel.clipsToBounds  =  true
            self.view.addSubview(toastLabel)
            UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
                toastLabel.alpha = 0.0
            }, completion: {(isCompleted) in
                toastLabel.removeFromSuperview()
            })
        }

}
