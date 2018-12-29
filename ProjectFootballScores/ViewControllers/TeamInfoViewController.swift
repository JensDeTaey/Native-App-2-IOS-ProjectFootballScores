//
//  TeamInfoViewController.swift
//  ProjectFootballScores
//
//  Created by Jens De Taey on 23/12/2018.
//  Copyright © 2018 Jens De Taey. All rights reserved.
//

import UIKit
import SVGKit
import RealmSwift

class TeamInfoViewController: UIViewController {

    var team : Team?
    
    
    @IBOutlet weak var TeamNameLabel: UILabel!
    
    
    @IBOutlet weak var TeamLogoImage: UIImageView!
    @IBOutlet weak var TeamAreaNameLabel: UILabel!
    @IBOutlet weak var TeamFoundedLabel: UILabel!
    @IBOutlet weak var TeamColors: UILabel!
    @IBOutlet weak var TeamAddress: UILabel!
    @IBOutlet weak var TeamPhoneLabel: UILabel!
    @IBOutlet weak var TeamEmailLabel: UILabel!
    @IBOutlet weak var TeamWebsiteLabel: UILabel!
    @IBOutlet weak var PlayerButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        TeamNameLabel.text = team?.name
        TeamAddress.text = team?.address
        TeamColors.text = team?.clubColors
        TeamPhoneLabel.text = team?.phone
        TeamEmailLabel.text = team?.email
        TeamWebsiteLabel.text = team?.website
        if(team?.crestUrl != nil){
            let data = try? Data(contentsOf: (team?.crestUrl)!)
            
            let anSVGImage: SVGKImage = SVGKImage(data: data)
            TeamLogoImage.image = anSVGImage.uiImage
        }
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    /*@IBAction func PlayerPushed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "SelectPlayers", sender: team?.id)
    }*/
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectAllPlayers"{
            if let des = segue.destination as? PlayersTableViewController{
                //let team = teamTableView.indexPathForSelectedRow?.row
                des.teamId = sender as? Int
            }
        }
        
        
     
     
    }
    
    @IBAction func SeeAllPlayersPushed(_ sender: Any) {
        self.performSegue(withIdentifier: "SelectAllPlayers", sender: team?.id)
    }
}
