//
//  ApiConnectionController.swift
//  ProjectFootballScores
//
//  Created by Jens De Taey on 26/12/2018.
//  Copyright © 2018 Jens De Taey. All rights reserved.
//

import Foundation
import UIKit

class ApiConncectionController{
    
    let baseUrl = "https://api.football-data.org/v2"
    
    func fetchCompetitions(completion: @escaping (_ competitions :[Competition]?)->(Void)){
        let url =  URL(string: baseUrl + "/competitions")!
        let request = setHTTPHeader(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data,
            response, error) in
            let jsonDecoder = JSONDecoder()
            
            if let data = data,
                let competitions = try? jsonDecoder.decode(Competitions.self,from: data)
            {
                completion(competitions.competitions)
            }
            
        }
        task.resume()
        
    }
    
    func fetchTeams(competitonId:Int,completion: @escaping (_ teams :[Team]?)->(Void)){
        let url = URL(string: baseUrl + "/competitions/" + String(competitonId) + "/teams")!
        print(url)
        let request = setHTTPHeader(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data,
            response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
                let teams = try? jsonDecoder.decode(Teams.self,from: data),let string = String(data: data, encoding: .utf8)
                
            {
                print(teams)
                print(data)
                print(string)
                completion(teams.teams)
            }
        }
        task.resume()
    }
    
    func fetchTeamWithPlayers(teamId:Int,completion: @escaping (_ team :Team?)->(Void)){
        let url = URL(string: baseUrl + "/teams/" + String(teamId))!
        let request = setHTTPHeader(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data,
            response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
                let team = try? jsonDecoder.decode(Team.self,from: data){
                completion(team)
            }
        }
        task.resume()
    }
    
    // fetching all matches that are played today
    func fetchCurrentMatches(completion: @escaping (_ matches :[Match]?)->(Void)){
        let url = URL(string: baseUrl + "/matches")
        let request = setHTTPHeader(url: url!)
        let task = URLSession.shared.dataTask(with: request) { (data,
            response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
                let matches = try? jsonDecoder.decode(Matches.self,from: data)
            {
                completion(matches.matches)
            }
        }
        task.resume()
    }
    
    // fetching all matches from favorite team that are finished
    func fetchUpcomingMatchesFinishedWithId(teamId:Int,completion: @escaping (_ matches :[Match]?)->(Void)){
        let url = URL(string: baseUrl + "/teams/" + String(teamId) + "/matches?status=FINISHED")
        let request = setHTTPHeader(url: url!)
        let task = URLSession.shared.dataTask(with: request) { (data,
            response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
                let matches = try? jsonDecoder.decode(Matches.self,from: data)
            {
                completion(matches.matches)
            }
        }
        task.resume()
    }
    
    // fetching all matches from favorite team that are finished
    func fetchUpcomingMatchesScheduledWithId(teamId:Int,completion: @escaping (_ matches :[Match]?)->(Void)){
        let url = URL(string: baseUrl + "/teams/" + String(teamId) + "/matches?status=SCHEDULED")
        let request = setHTTPHeader(url: url!)
        let task = URLSession.shared.dataTask(with: request) { (data,
            response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
                let matches = try? jsonDecoder.decode(Matches.self,from: data)
            {
                completion(matches.matches)
            }
        }
        task.resume()
    }
   //https://api.football-data.org/v2/teams/86/matches?status=SCHEDULED
    
    func setHTTPHeader(url : URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.setValue("953751ac9efe4a63aebef35f96fdf210", forHTTPHeaderField: "X-Auth-Token")
        request.httpMethod = "GET"
        return request
    }
    
    
    
    
}
