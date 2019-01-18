//
//  PlayersTableViewController.swift
//  ProjectFootballScores
//
//  Created by Jens De Taey on 26/12/2018.
//  Copyright © 2018 Jens De Taey. All rights reserved.
//

import UIKit

class PlayersTableViewController: UITableViewController {

    var teamId : Int?
    var team : Team?
    var squad = [Player]()
    var goalkeepers = [Player]()
    var Defender = [Player]()
    var Midfielder = [Player]()
    var Attacker = [Player]()
    var Coach = [Player]()
    
    @IBOutlet var PlayersTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(teamId)
        self.squad = []
        let connectiontest :ApiConncectionController = ApiConncectionController()
        connectiontest.fetchTeamWithPlayers(teamId: teamId!)
        { team in
            if let team = team {
                DispatchQueue.main.async {
                    print(team)
                    self.team = team
                    self.PlayersTableView.reloadData()
                    self.squad = team.players!
                    self.dividePlayers()
                    self.PlayersTableView.reloadData()
                }
            }
        }
        
        
    }

    // MARK: - Table view data source
    private func dividePlayers() {
        squad.forEach { (Player : Player) in
            switch Player.position{
            case "Goalkeeper":
                goalkeepers.append(Player)
            case "Defender":
                Defender.append(Player)
            case "Midfielder":
                Midfielder.append(Player)
            case "Attacker":
                Attacker.append(Player)
            default:
                Coach.append(Player)
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Goalkeepers"
        case 1:
            return "Defenders"
        case 2:
            return "Midfielders"
        case 3:
            return "Attackers"
        case 4:
                return "Coach"
        default:
            return "Player"
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
            return goalkeepers.count
        case 1:
            return Defender.count
        case 2:
            return Midfielder.count
        case 3:
            return Attacker.count
        case 4:
            return Coach.count
        default:
            return 1
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerTableViewCell
        switch indexPath.section {
        case 0:
            cell.player = goalkeepers[indexPath.row]
        case 1:
            cell.player = Defender[indexPath.row]
        case 2:
            cell.player = Midfielder[indexPath.row]
        case 3:
            cell.player = Attacker[indexPath.row]
        case 4:
            cell.player = Coach[indexPath.row]
        default:
            cell.player = squad[indexPath.row]
        }
        
        
        return cell
    }
    

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
