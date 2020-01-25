//
//  ViewController.swift
//  RingOverSample
//
//  Created by MacBook on 25/01/2020.
//  Copyright © 2020 ringover. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    

    
    @IBOutlet weak var missedCallLbl: UILabel!
    @IBOutlet weak var voiceMailsLbl: UILabel!
    @IBOutlet weak var smsLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataFromJson()
    }
    
    func loadDataFromJson(){
        
        guard let path = Bundle.main.path(forResource: "recentcomm", ofType: "txt") else { return }
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            //print(json)
            
            guard let array = json as? [Any] else { return }
            
            for communication in array {
                guard let communicationDict = communication as? [String: Any] else { return }
                
                guard let startTime = communicationDict["startTime"] as? String else { return }
                guard let type = communicationDict["type"] as? [String: String] else { return }
                guard let result = communicationDict["result"] else { return }
                
                
                print(startTime)
                print(type)
                print(result)
            }
        }
        catch {
            print(error)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CallTableViewCell
        
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

}

