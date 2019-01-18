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
        print(team?.area?.name)
        TeamAreaNameLabel.text = team?.area?.name
        TeamFoundedLabel.text = "\(team?.founded.value ?? 1909)"
        TeamAddress.text = team?.address ?? "Not available"
        TeamColors.text = team?.clubColors ?? "Not available"
        TeamPhoneLabel.text = team?.phone ?? "Not available"
        TeamEmailLabel.text = team?.email ?? "Not available"
        TeamWebsiteLabel.text = team?.website ?? "Not available"
        print(team?.crestUrl)
        if team?.crestUrl != nil || team?.area?.name != "France"{
            let data = try! Data(contentsOf: (team?.crestUrl)!)
            if SVGKImage(data: data) != nil {
                let anSVGImage: SVGKImage = SVGKImage(data: data)
                TeamLogoImage.image = anSVGImage.uiImage
            }else{
                TeamLogoImage.isHidden = true
            }
        }else{
            TeamLogoImage.isHidden = true
        }
    }
    

    
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
