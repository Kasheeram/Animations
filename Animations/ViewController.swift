//
//  ViewController.swift
//  Animations
//
//  Created by kashee on 17/12/18.
//  Copyright © 2018 kashee. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    lazy var showAnimation:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(showAnimatedView), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(showAnimation)
        showAnimation.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        showAnimation.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        showAnimation.widthAnchor.constraint(equalToConstant: 150).isActive = true
        showAnimation.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func showAnimatedView(){
        SwiftLoader.shared.show()
    }

}

