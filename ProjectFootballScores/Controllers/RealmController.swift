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
    
    var teams :  Results<Team> = try!Realm().objects(Team.self)
    
    // add a team to realm
    func addTeam(team : Team,completion: @escaping (Error?) -> Void) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(team)
            }
            updateTeam()
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
            try realm.write {
                realm.delete(teamToDelete)
            }
            updateTeam()
        } catch let error as NSError {
            completion(error)
            return
        }
        completion(nil)
    }
    
    func updateTeam(){
        teams = try! Realm().objects(Team.self)
    }
}
