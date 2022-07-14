//
//  DetailsViewController.swift
//  cinefilando
//
//  Created by lrsv on 13/07/22.
//

import UIKit

class DetailsViewController: UIViewController {

    var movie: Movie?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = movie?.title
        print(movie?.title)
        // Do any additional setup after loading the view.
    }
    

}
