//
//  MovieTableViewController.swift
//  Movies Objective C
//
//  Created by Greg Hughes on 12/20/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController {

    
    var movies : [Movies] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
            
        }
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
        self.navigationItem.searchController = searchController
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
        
        let movie = movies[indexPath.row]
        
        cell.movies = movie
        
        return cell
    }
}


// MARK: - Search Bar
extension MovieTableViewController: UISearchBarDelegate {
    
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        let searchTerm = searchBar.text ?? ""
        
        
        GMHMovieController.fetchMovies(searchTerm) { (movies) in
            
            guard let searchedMovies = movies else {return}
            
            self.movies = searchedMovies
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
