//
//  UpcomingGamesTableViewController.swift
//  ProjectFootballScores
//
//  Created by Jens De Taey on 18/01/2019.
//  Copyright © 2019 Jens De Taey. All rights reserved.
//

import UIKit

class UpcomingGamesTableViewController: UITableViewController {
    
    private var matchesScheduled = [Match]()
    private var matchesFinished = [Match]()
    var teamId : Int = 0

    @IBOutlet var upComingGamesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.matchesFinished = []
        self.matchesScheduled = []
        
        let connection :ApiConncectionController = ApiConncectionController()
        connection.fetchUpcomingMatchesScheduledWithId(teamId: teamId){ matches in
            if let matches = matches {
                DispatchQueue.main.async {
                    self.matchesScheduled = matches
                    self.upComingGamesTableView.reloadData()
                }
            }
        }
        
        connection.fetchUpcomingMatchesFinishedWithId(teamId: teamId){ matches in
            if let matches = matches {
                DispatchQueue.main.async {
                    self.matchesFinished = matches
                    self.upComingGamesTableView.reloadData()
                }
            }
        }
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return matchesFinished.count
        case 1:
            return matchesScheduled.count
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Already played games"
        case 1:
            return "Upcoming matches"
        default:
            return "Other matches"
        }
    }

    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "UpComingMatchCell", for: indexPath) as! UpComingMatchesTableViewCell
        if indexPath.section == 0{
            cell.match = matchesFinished[indexPath.row]
        }else{
            cell.match = matchesScheduled[indexPath.row]
        }
     return cell
     }
    
}
