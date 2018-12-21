//
//  MovieTableViewCell.swift
//  Movies Objective C
//
//  Created by Greg Hughes on 12/20/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    
    var movies : Movies?{
        
        didSet {
            
            updateViews()
        }
    }
    
    
    
    func updateViews(){
        
        guard let movie = movies else {return}
        
        GMHMovieController.fetchMovieImages(movie) { (image) in
            
            DispatchQueue.main.async {
                
                self.titleLabel.text = movie.title
                self.ratingLabel.text = "\(movie.rating)"
                self.overviewLabel.text = movie.overview
                self.movieImage.image = image
            }
        }
    }
}

