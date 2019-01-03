//
//  MatchesTableViewController.swift
//  ProjectFootballScores
//
//  Created by Jens De Taey on 31/12/2018.
//  Copyright © 2018 Jens De Taey. All rights reserved.
//

import UIKit

class MatchesTableViewController: UITableViewController {

    var matches = [Match]()
    var matchesInSections = [[Match]]()
    
    @IBOutlet var MatchesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        matches.self = []
        self.matchesInSections = [[Match](), [Match](), [Match](),[Match](),[Match](),[Match](),[Match](),[Match](),[Match](),[Match](),[Match](),[Match]()]
        
        
        let connection :ApiConncectionController = ApiConncectionController()
        connection.fetchCurrentMatches { matches in
            if let matches = matches {
                DispatchQueue.main.async {
                    self.matches = matches
                    self.DivideMatchInCompetition()
                    print(self.matchesInSections)
                    self.MatchesTableView.reloadData()
                    print(self.matches)
                }
            }
            
            
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 12
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Premier League"
        case 1:
            return "Championship"
        case 2:
            return "Bundesliga"
        case 3:
            return "La Liga"
        case 4:
            return "Ligue 1"
        case 5:
            return "Primeira Liga"
        case 6:
            return "Serie A"
        case 7:
            return "Erdedivisie"
        case 8:
            return "Champions League"
        case 9:
            return "World Cup"
        case 10:
            return "European Cup"
        case 11:
            return "Serie A (Brazil)"
        default:
            return "Other competitions"
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return matchesInSections[section].count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MatchesTableView.dequeueReusableCell(withIdentifier: "MatchCell", for: indexPath) as! MatchTableViewCell
        cell.match = matchesInSections[indexPath.section][indexPath.row] as! Match
        return cell
    }
    
    private func DivideMatchInCompetition(){
        // 2d array with fixed spots per competition
        self.matches.forEach({ (match : Match) in
            switch(match.competition.id){
            case 2021: matchesInSections[0].append(match) // Premier league
                case 2016: matchesInSections[1].append(match) //Championship
                case 2002: matchesInSections[2].append(match) //Bundesliga
                case 2014: matchesInSections[3].append(match) //Primera Division
                case 2015: matchesInSections[4].append(match) // Ligue 1
                case 2017: matchesInSections[5].append(match) //Primeira Liga
                case 2019: matchesInSections[6].append(match) //Serie A Italy
                case 2003: matchesInSections[7].append(match) //Eredivisie
                case 2001: matchesInSections[8].append(match) // Champions League
                case 2000: matchesInSections[9].append(match) //WK
                case 2018: matchesInSections[10].append(match) //EK
                case 2013: matchesInSections[11].append(match) //Serie a Brazil
            default : matchesInSections[12].append(match)
            }
        })
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
