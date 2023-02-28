//
//  SettingsViewController.swift
//  Random User API
//
//  Created by Tyler Radke on 2/27/23.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SettingsTableViewCellDelegate {
   
    enum Error: Error, LocalizedError {
        
        typealias RawValue = String
        
        case errorFindingUser
        case errorDecodingUser
    }

   
    
  
    

    
    
    
    @IBOutlet weak var settingsTableView: UITableView!
    
    @IBOutlet weak var howMany: UITextField!
    
    var settings: [String: Bool] = [
        "gender" : true,
        "location" : true,
        "email" : true,
        "nationality" : true,
        "phone" : true,
        "DOB" : true
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        
       
        // Do any additional setup after loading the view.
    }
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settings.keys.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingsTableView.dequeueReusableCell(withIdentifier: "settingCell") as! SettingsTableViewCell
        
        configure(cell: cell, forRowAt: indexPath)
        
        return cell
    }
    
    func configure(cell: SettingsTableViewCell, forRowAt indexPath: IndexPath) {
        let settingsArray = Array(settings.keys)
        cell.settingLabel.text = settingsArray[indexPath.row]
    }
    
    @IBAction func generateButtonTapped(_ sender: UIButton) {
        Task {
            try await makeCall()
        }
       
        
    }
    func updateBool(forKey key: String) {
        settings[key]?.toggle()
    }
    
    func makeCall() async throws {
        guard let text = howMany.text, let _ = Int(text) else { return }
        
        var url = API.url
        
        var components: [String: String] = ["inc":"picture, name,"]
        
        for key in settings.keys {
            if settings[key]! {
                components["inc"]! += (key + ",")
            }
            
        }
        let componentsToAppend = components.map({
            URLQueryItem(name: $0.key, value: $0.value)
        })
        
        url = url?.appending(queryItems: componentsToAppend)
     
        Task {
    
            let data = try await URLSession.shared.data(for: URLRequest(url: url!))
            
            
            
            let decoder = JSONDecoder()
            
            let user = try decoder.decode(User.self, from: data.0)
            
            print(user)
        }
        
       
        
    
        
        
        
    }
    
}


