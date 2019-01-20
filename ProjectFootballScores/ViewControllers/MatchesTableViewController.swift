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
        self.matches = []
        self.matchesInSections = [[Match](), [Match](), [Match](),[Match](),[Match](),[Match](),[Match](),[Match](),[Match](),[Match](),[Match](),[Match]()]
        
        
        let connection :ApiConncectionController = ApiConncectionController()
        connection.fetchCurrentMatches { matches in
            if let matches = matches {
                DispatchQueue.main.async {
                    self.matches = matches
                    self.DivideMatchInCompetition()
                    self.MatchesTableView.reloadData()
                }
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 12
    }
    
    //setting all the names of the available competitions
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
        return matchesInSections[section].count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MatchesTableView.dequeueReusableCell(withIdentifier: "MatchCell", for: indexPath) as! MatchTableViewCell
        print(indexPath.section)
        print(indexPath.row)
        cell.match = matchesInSections[indexPath.section][indexPath.row]
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
    
    @IBAction func refresh(_ sender: Any) {
        let connection :ApiConncectionController = ApiConncectionController()
        connection.fetchCurrentMatches { matches in
            if let matches = matches {
                DispatchQueue.main.async {
                    self.matches = []
                    self.matchesInSections = [[Match](), [Match](), [Match](),[Match](),[Match](),[Match](),[Match](),[Match](),[Match](),[Match](),[Match](),[Match]()]
                    self.matches = matches
                    self.DivideMatchInCompetition()
                    self.MatchesTableView.reloadData()
                    self.refreshControl?.endRefreshing()
                }
            }
        }
    }
    
    

}
