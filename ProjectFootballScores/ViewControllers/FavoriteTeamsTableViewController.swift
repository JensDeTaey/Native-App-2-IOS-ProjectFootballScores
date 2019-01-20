//
//  FavoriteTeamsTableViewController.swift
//  ProjectFootballScores
//
//  Created by Jens De Taey on 29/12/2018.
//  Copyright © 2018 Jens De Taey. All rights reserved.
//

import UIKit

class FavoriteTeamsTableViewController: UITableViewController {
    private var teams = RealmController.singletonRealm.teams

    @IBOutlet var FavoriteTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        teams = RealmController.singletonRealm.teams
        self.FavoriteTableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.async {
        self.teams =  RealmController.singletonRealm.teams
        self.FavoriteTableView.reloadData()
           
        //checking if list in realm is empty.
        if (self.teams.isEmpty){
            self.tableView.setEmptyMessage("No Teams selected as favorite yet")
        }else{
            self.tableView.restore()
        }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //load teams again, if one gets removed
        self.teams =  RealmController.singletonRealm.teams
        return teams.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteTeamCell", for: indexPath) as! FavoriteTeamTableViewCell
        cell.team = teams[indexPath.row]
        return cell
    }
    
    //make delete of a row possible
    override func tableView(_ tableView: UITableView,
                               editingStyleForRowAt indexPath: IndexPath) ->
        UITableViewCell.EditingStyle {
            return .delete
    }
    
    //Excerpt From: Apple Education. “App Development with Swift”. Apple Inc. - Education, 2017. Apple Books. https://itunes.apple.com/be/book/app-development-with-swift/id1219117996?mt=11
 

    @IBAction func editMode(_ sender: Any) {
        self.FavoriteTableView.isEditing = !self.FavoriteTableView.isEditing
    }
    
    //function for removing a team from realm
    override func tableView(_ tableView: UITableView, commit
        editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath:
        IndexPath) {
        if editingStyle == .delete
        {
            let team  = teams[indexPath.row]
            RealmController.singletonRealm.deleteTeam(teamToDelete: team)
            {
                error in
                if error != nil {
                    print("failed delete")
                } else {
                    //There were no errors
                    tableView.deleteRows(at: [indexPath], with: . automatic)
                    print("succes delete")
                }
            }
        }
    }
    
    //Excerpt From: Apple Education. “App Development with Swift”. Apple Inc. - Education, 2017. Apple Books. https://itunes.apple.com/be/book/app-development-with-swift/id1219117996?mt=11
    
    //function if a team get selected
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let team = self.teams[indexPath.row] as? Team{
            self.performSegue(withIdentifier: "toUpcomingGames", sender: team.id)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toUpcomingGames"{
            if let des = segue.destination as? UpcomingGamesTableViewController{
                //set the id of the team that is selected
                des.teamId = (sender as? Int)!
            }
        }
    }

}

// extension for a tableview to show message when the tableview is empty
extension UITableView {
    
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 15)
        messageLabel.sizeToFit()
        self.backgroundView = messageLabel;
        self.separatorStyle = .none;
    }
    
    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}

// source: https://stackoverflow.com/questions/15746745/handling-an-empty-uitableview-print-a-friendly-message
