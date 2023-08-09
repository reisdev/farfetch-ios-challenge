//
//  RectanglesViewController.swift
//  FFExerciseTemplate
//
//  Created by João David on 20/03/2018.
//  Copyright © 2018 Farfetch. All rights reserved.
//

import UIKit


/**
*   UI_E1
*
*   1 - Create one red UIView with (width: 200, height: 100). It should be at 20px distance from the UINavigationBar.
*   2 - Create one blue UIView with (width: 200, height: 100). It should be at 20px distance from the Bottom.
*   3 - Add a UILabel with the text "FF Candidate". It should be 20px below the red UIView.
*
*   Requirements:
*
*   - You cannot use Interface Builder (it should be done programatically)
*   - All views should be centered horizontally
*   - If you use autolayout, you must define it with the minimum constraints possible
*   - You should be able to rotate the device and everything should be repositioned
*   - You can use UI_E1.png as a reference
*/
final class RectanglesViewController: UIViewController {
    
    private lazy var redRectangleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    private lazy var blueRectangleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    
    private lazy var label: UIView = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "FF Candidate"
        label.textColor = .black
        return label
    }()

    override func viewDidLoad() {

        super.viewDidLoad()

        self.title = "UI-E1"

        self.view.backgroundColor = .white
        
        setupSubviews()
    }
    
    private func setupSubviews() {
        view.addSubview(redRectangleView)
        view.addSubview(label)
        view.addSubview(blueRectangleView)
        
        NSLayoutConstraint.activate([
            redRectangleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20.0),
            redRectangleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            redRectangleView.widthAnchor.constraint(equalToConstant: 200.0),
            redRectangleView.heightAnchor.constraint(equalToConstant: 100.0),
            
            label.topAnchor.constraint(equalTo: redRectangleView.bottomAnchor, constant: 20.0),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            blueRectangleView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20.0),
            blueRectangleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            blueRectangleView.widthAnchor.constraint(equalToConstant: 200.0),
            blueRectangleView.heightAnchor.constraint(equalToConstant: 100.0),
        ])
    }
}
