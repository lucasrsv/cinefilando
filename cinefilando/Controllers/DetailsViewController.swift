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
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: movie.releaseDate)
        print(date)
        let finalDateFormatter = DateFormatter()
        finalDateFormatter.dateFormat = "MMM dd,yyyy"
        print(finalDateFormatter.string(from: date!))
        
        self.title = movie.title
        
        Task {
            let imageData = await Movie.downloadImageData(withPath: movie.backdropPath)
            let image = UIImage(data: imageData) ?? UIImage()
            self.backdropImage.image = image
        }
        
        titleLabel.text = movie.title
        posterImage.image = UIImage(named: movie.posterPath)
        ratingLabel.text = "Rating: \(movie.voteAverage)/10"
        overviewLabel.text = movie.overview

    }
    

}
