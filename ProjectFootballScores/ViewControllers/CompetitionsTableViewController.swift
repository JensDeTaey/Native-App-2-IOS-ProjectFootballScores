//
//  CompetitionsTableViewController.swift
//  ProjectFootballScores
//
//  Created by Jens De Taey on 02/12/2018.
//  Copyright © 2018 Jens De Taey. All rights reserved.
//

import UIKit

class CompetitionsTableViewController: UITableViewController {

    @IBOutlet var competitionTableView: UITableView!
    var competitions = [Competition]()
    
    // list of ids that i can use of the competitions
    let ids = [2000,2001,2002,2003,2013,2014,2015,2016,2017,2018,2019,2021]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        competitions.self = []
        var competitionsInUse = [Competition]()
        let connection :ApiConncectionController = ApiConncectionController()
        connection.fetchCompetitions { competitions in
            if let competitions = competitions {
                DispatchQueue.main.async {
                    // Filter the competitions that i can use through all of them
                    competitions.forEach({ (anycompetition : Competition) in
                        self.ids.forEach({ (id : Int) in
                            if(anycompetition.id == id){
                                competitionsInUse.append(anycompetition)
                            }
                        })
                    })
                    self.competitions = competitionsInUse
                    self.competitionTableView.reloadData()
                }
            }
        }
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return competitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = competitionTableView.dequeueReusableCell(withIdentifier: "competitionCell", for: indexPath) as! CompetitionCell
        cell.competiton = competitions[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let competition = self.competitions[indexPath.row] as? Competition{
            self.performSegue(withIdentifier: "SelectCompetition", sender: competition)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectCompetition"{
            if let comp = segue.destination as? TeamsTableViewController{
                let index = competitionTableView.indexPathForSelectedRow?.row
                //set competition that is selected
                comp.competition = competitions[index!]
            }
        }
    }
}
