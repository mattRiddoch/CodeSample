//
//  ViewController.swift
//  CodeSample
//
//  Created by Matthew Riddoch on 8/9/19.
//  Copyright © 2019 Matthew Riddoch. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var userArray = [User]()
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowUser = userArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = rowUser.fname + " " + rowUser.lname
        cell.detailTextLabel?.text = rowUser.city
        return cell
    }
    
    
    var networkManager = NetworkManager()
    
//    init (networkManager: NetworkManager) {
//        super.init(nibName: nil, bundle: nil)
//        self.networkManager = networkManager
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
//    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        view.backgroundColor = .gray
        let alert = UIAlertController(title: nil, message: "Please wait, Attempting to load users...", preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        
        
        networkManager.getAllUsers() { users, error in
            
            self.present(alert, animated: true, completion: nil)
            
            if let error = error {
                print(error)
            }
            
            if let users = users {
                DispatchQueue.main.async {
                    self.userArray = users
                    self.tableView.reloadData()
                    self.dismiss(animated: false, completion: nil)
                }
                
                
                
            }
        }
    }


}

