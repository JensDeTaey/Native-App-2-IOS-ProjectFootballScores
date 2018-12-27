//
//  ViewController.swift
//  ProjectFootballScores
//
//  Created by Jens De Taey on 01/12/2018.
//  Copyright © 2018 Jens De Taey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let url = URL(string: "https://api.football-data.org/v2/competitions/2003/")!
        var request = URLRequest(url: url)
        request.setValue("953751ac9efe4a63aebef35f96fdf210", forHTTPHeaderField: "X-Auth-Token")
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { (data,
            response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
            let string = String(data: data, encoding: .utf8) {
                print(string)
            }
            if let data = data,
                let competition = try? jsonDecoder.decode(Competition.self,from: data)
                {
                print(competition)
            }
            
        }
        task.resume()
        
    
    }
    
    
    
    

}

