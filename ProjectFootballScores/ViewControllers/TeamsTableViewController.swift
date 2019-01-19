//
//  TeamsTableViewController.swift
//  ProjectFootballScores
//
//  Created by Jens De Taey on 20/12/2018.
//  Copyright © 2018 Jens De Taey. All rights reserved.
//

import UIKit

class TeamsTableViewController: UITableViewController {

    @IBOutlet var teamTableView: UITableView!
    var teams = [Team]()
    var competition : Competition?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teams.self = []
        let connection :ApiConncectionController = ApiConncectionController()
        connection.fetchTeams(competitonId: (competition?.id)!)
        { teams in
            if let teams = teams {
                DispatchQueue.main.async {
                    
                    self.teams = teams
                    print("oproeping van resetStarts")
                    self.resetStars()
                    self.teamTableView.reloadData()
                    }
                
                }
            }

        }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.teams.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = teamTableView.dequeueReusableCell(withIdentifier: "TeamCell", for: indexPath) as! TeamCell
        
        cell.team = teams[indexPath.row]
        
        //cell.textLabel?.text = teams[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let team = self.teams[indexPath.row] as? Team{
            print(team)
            self.performSegue(withIdentifier: "SelectTeam", sender: team)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectTeam"{
            if let des = segue.destination as? TeamInfoViewController{
                des.team = sender as? Team
            }
        }
    }
   
    func resetStars(){
        let teamsSaved = RealmController.singletonRealm.teams
        teams.forEach { (team : Team) in
            teamsSaved.forEach({ (teamFav:Team) in
                if(team.id == teamFav.id){
                    team.isFavorite = true
                }
            })
            
        }
    }
    
}
