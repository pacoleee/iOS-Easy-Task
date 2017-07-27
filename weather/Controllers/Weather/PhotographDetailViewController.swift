//
//  PhotographDetailViewController.swift
//  weather
//
//  Created by Paco Lee on 2017-07-27.
//  Copyright © 2017 Paco Lee. All rights reserved.
//

import UIKit

class PhotographDetailViewController: UIViewController {
    static let identifier = "PhotographDetailViewController"
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var imageView: UIImageView!
    
    var image: UIImage?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        imageView.image = image
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 6.0
        scrollView.delegate = self
    }
    
    func config(image: UIImage) {
        self.image = image
    }
}

extension PhotographDetailViewController: UIScrollViewDelegate  {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}

