//
//  ViewController.swift
//  GenericRequest
//
//  Created by Levy Cristian on 08/09/19.
//  Copyright © 2019 Levy Cristian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    
    /** Variable responsible to displaying text response on screen */
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        view.addSubview(label)
        return label
    }()
    
    private lazy var requestButton: UIButton = {
        let button = UIButton()
        button.setTitle("Click Here", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.addTarget(self, action: #selector(requestButtonDidTapped(_:)), for: .touchUpInside)
        
        view.addSubview(button)
        return button
    }()
    
    // MARK: App Life cicle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        requestButton.translatesAutoresizingMaskIntoConstraints = false
        requestButton.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        requestButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        requestButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        requestButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.topAnchor.constraint(equalTo: requestButton.bottomAnchor, constant: 10).isActive = true
        textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

    }
    
    // MARK: Functions
    
    /** Action called  when request button is tapped */
    @objc func requestButtonDidTapped(_ button: UIButton){
        let request = Request<BoredAPI>()
        
        request.perform(BoredAPI.activity) { (bored: Bored?, error: Errors?) -> (Void) in
            guard let bored = bored else {return}
            self.textLabel.text = bored.description
            
        }
    }

}

