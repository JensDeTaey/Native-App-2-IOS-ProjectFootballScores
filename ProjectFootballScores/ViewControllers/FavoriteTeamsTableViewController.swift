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
        if (self.teams.isEmpty){
            self.tableView.setEmptyMessage("No Teams selected as favorite yet")
        }else{
            self.tableView.restore()
        }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return teams.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteTeamCell", for: indexPath)
        let team = teams[indexPath.row]
        cell.textLabel?.text = team.name

        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                               editingStyleForRowAt indexPath: IndexPath) ->
        UITableViewCell.EditingStyle {
            return .delete
    }
    
    //Excerpt From: Apple Education. “App Development with Swift”. Apple Inc. - Education, 2017. Apple Books. https://itunes.apple.com/be/book/app-development-with-swift/id1219117996?mt=11
 

    @IBAction func editMode(_ sender: Any) {
        self.FavoriteTableView.isEditing = !self.FavoriteTableView.isEditing
    }
    override func tableView(_ tableView: UITableView, commit
        editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath:
        IndexPath) {
        if editingStyle == .delete {
            let team  = teams[indexPath.row]
            RealmController.singletonRealm.deleteTeam(teamToDelete: team){
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
