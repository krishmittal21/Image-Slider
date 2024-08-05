//
//  ViewController.swift
//  VAIDid13
//
//  Created by Krish Mittal on 05/08/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageSliderView = ImageSliderView2()
        view.addSubview(imageSliderView)
        
        imageSliderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageSliderView.topAnchor.constraint(equalTo: view.topAnchor),
            imageSliderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageSliderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageSliderView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

