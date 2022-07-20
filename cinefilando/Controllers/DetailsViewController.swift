//
//  DetailsViewController.swift
//  cinefilando
//
//  Created by lrsv on 13/07/22.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var backdropImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var movie: Movie?
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let movie = movie else {
            return
        }
        
        self.title = movie.title
        
        Task {
            let backdropData = await Movie.downloadImageData(withPath: movie.backdropPath)
            let backdrop = UIImage(data: backdropData) ?? UIImage()
            self.backdropImage.image = backdrop
            
            let posterData = await Movie.downloadImageData(withPath: movie.posterPath)
            let poster = UIImage(data: posterData) ?? UIImage()
            self.posterImage.image = poster
        }
        
        titleLabel.text = movie.title
        ratingLabel.text = "Rating: \(movie.voteAverage)/10"
        overviewLabel.text = movie.overview

    }
    

}
