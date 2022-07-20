//
//  FeaturedViewController.swift
//  cinefilando
//
//  Created by lrsv on 06/07/22.
//

import UIKit

class FeaturedViewController: UIViewController {
    
    var popularMovies: [Movie] = []
    var nowPlayingMovies: [Movie] = []
    var upcomingMovies: [Movie] = []
    
    @IBOutlet weak var nowPlayingCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var upcomingCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popularCollectionView.dataSource = self
        nowPlayingCollectionView.dataSource = self
        upcomingCollectionView.dataSource = self
        
        popularCollectionView.delegate = self
        nowPlayingCollectionView.delegate = self
        upcomingCollectionView.delegate = self
    
        Task {
            popularMovies = await Movie.popularMoviesAPI()
            self.popularCollectionView.reloadData()
            upcomingMovies = await Movie.upcomingMoviesAPI()
            self.upcomingCollectionView.reloadData()
            nowPlayingMovies = await Movie.nowPlayingMoviesAPI()
            self.nowPlayingCollectionView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController {
            let movie = sender as? Movie
            destination.movie = movie
        }
    }
}

