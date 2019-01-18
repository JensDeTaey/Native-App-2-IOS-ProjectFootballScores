//
//  RealmController.swift
//  ProjectFootballScores
//
//  Created by Jens De Taey on 28/12/2018.
//  Copyright © 2018 Jens De Taey. All rights reserved.
//

import Foundation
import RealmSwift

class RealmController{
    
    static let singletonRealm : RealmController = RealmController()
    
    private var teamsInRealm :  Results<Team> = try! Realm().objects(Team.self)
    private var copyTeams : [Team] = []
    
    var teams:[Team]{
        get{
            guard teamsInRealm != nil else{return []}
            var copiedTeams: [Team] = []
            teamsInRealm.forEach{team in
                copiedTeams.append(team.copy() as! Team)
            }
            return copiedTeams
        }
    }
    
    // add a team to realm
    func addTeam(team : Team,completion: @escaping (Error?) -> Void) {
        do {
            let realm = try Realm()
            let teamCopy = team.copy() as! Team
            try realm.write {
                team.isFavorite = true
                realm.add(teamCopy)
            }
            
            
        } catch let error as NSError {
            completion(error)
            return
        }
        completion(nil)
        
    }
    
    // delete a team from realm
    func deleteTeam(teamToDelete : Team,completion: @escaping (Error?) -> Void) {
        do {
            let realm = try Realm()
            //teamToDelete.isFavorite = false
            guard let copyTeam = teamsInRealm.first(where: {$0.id == teamToDelete.id}) else{
                print("Could not find team with name: '\(teamToDelete.name)' in saved list in Realm")
                return
            }
            try realm.write {
                realm.delete(copyTeam)
            }
        } catch let error as NSError {
            completion(error)
            return
        }
        completion(nil)
    }
}
