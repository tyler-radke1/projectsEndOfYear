//
//  ViewController.swift
//  Randomizing TableView
//
//  Created by Tyler Radke on 2/24/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    var users: [String] = []
    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var randomUserLabel: UILabel!
    
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        randomUserLabel.text = "Get started by entering a user"
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        
        configure(cell, at: indexPath)
        
        return cell
        
    }
    
    
    func configure(_ cell: UITableViewCell, at indexPath: IndexPath) {
        cell.textLabel!.text = users[indexPath.row]
    }

    
    
    @IBAction func enterUserButton(_ sender: UIButton) {
        if let user = userTextField.text {
            users.append(user)
            randomUserLabel.text = "Hit enter to get a random user!"
            userTextField.text = ""
            myTableView.reloadData()
        }
    }
    
    
    @IBAction func GetUserButton(_ sender: UIButton) {
        
        let selectedUser = users.randomElement()
        
        randomUserLabel.text = "Your random user is: \(selectedUser!)"
    }
    
    @IBAction func resetButton(_ sender: UIBarButtonItem) {
        users = []
        randomUserLabel.text = "Get started by entering a user"
        userTextField.text = ""
        myTableView.reloadData()
    }
}

