//
//  ViewController.swift
//  GitHub-GraphQL-example
//
//  Created by Admin on 2016-10-15.
//  Copyright © 2016 ToyBox Media. All rights reserved.
//

import UIKit
import Apollo

class ViewController: UITableViewController {
    
    var repos:[AllReposQuery.Data.Viewer.Repository.Edge?]?{
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ApolloManager.shared.apollo.fetch(query: AllReposQuery()) { (result, error) in
            if let error = error {
                NSLog("Error while fetching query: \(error.localizedDescription)")
                return
            }
            
            guard let repoEdges = result?.data?.viewer.repositories.edges else {
                return
            }
            
            self.repos = repoEdges


        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repos?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let repoEdge = self.repos?[indexPath.row]
        
        cell.textLabel?.text = repoEdge?.node?.fragments.repoDetails.name
        
        return cell
    }


}

