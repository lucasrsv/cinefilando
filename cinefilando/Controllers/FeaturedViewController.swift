//
//  FeaturedViewController.swift
//  cinefilando
//
//  Created by lrsv on 06/07/22.
//

import UIKit

class FeaturedViewController: UIViewController {
    
    let popularMovies = Movie.popularMovies()
    let nowPlayingMovies = Movie.nowPlayingMovies()
    
    @IBOutlet weak var nowPlayingCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        popularCollectionView.dataSource = self
        nowPlayingCollectionView.dataSource = self
    }
}

