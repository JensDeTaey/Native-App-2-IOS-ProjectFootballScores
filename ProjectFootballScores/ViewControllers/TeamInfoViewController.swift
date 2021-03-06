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
    
    @IBOutlet weak var TeamWebsiteButton: UIButton!
    @IBOutlet weak var PlayerButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        TeamNameLabel.text = team?.name
        TeamAreaNameLabel.text = team?.area?.name
        TeamFoundedLabel.text = "\(team?.founded.value ?? 1909)"
        TeamAddress.text = team?.address ?? "Not available"
        TeamColors.text = team?.clubColors ?? "Not available"
        TeamPhoneLabel.text = team?.phone ?? "Not available"
        TeamEmailLabel.text = team?.email ?? "Not available"
        TeamWebsiteButton.setTitle(team?.website ?? "Not available", for: .normal)
        
            // check if the url is not null
            if team?.crestUrl != nil {
                let data = try? Data(contentsOf: (team?.crestUrl)!)
                //check if the data is not null
                if data != nil{
                    //not all extensions are .svg and need to be processed differently
                    if team?.crestUrl?.pathExtension == "svg"{
                        //another check if the data can be converted to an image
                        if SVGKImage(data: data) != nil {
                            let anSVGImage: SVGKImage = SVGKImage(data: data)
                            TeamLogoImage.image = anSVGImage.uiImage
                        }else{
                            TeamLogoImage.isHidden = true
                        }
                    }else{
                        TeamLogoImage.image  = UIImage(data : data!)
                    }
                }
        }else{
            TeamLogoImage.isHidden = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectAllPlayers"{
            if let des = segue.destination as? PlayersTableViewController{
                des.teamId = sender as? Int
            }
        }
    }
    
    @IBAction func SeeAllPlayersPushed(_ sender: Any) {
        self.performSegue(withIdentifier: "SelectAllPlayers", sender: team?.id)
    }
    
    //function when link website is pushed that opens it.
    @IBAction func LinkPushed(_ sender: Any) {
        if team?.website != nil || team?.website == ""{
            if let url = NSURL(string:(team?.website)!){
                UIApplication.shared.open(url as URL,options: [:])
            }
        }
    }
}
