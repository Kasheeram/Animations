//
//  SwiftLoader.swift
//  Animations
//
//  Created by kashee on 17/12/18.
//  Copyright © 2018 kashee. All rights reserved.
//

import UIKit

class topView:UIView {
    
    lazy var hideAnimatedView:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(hideView), for: .touchUpInside)
        return button
    }()
    
    @objc func hideView(){
        SwiftLoader.shared.hide()
    }
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
       
        self.addSubview(hideAnimatedView)
        hideAnimatedView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        hideAnimatedView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        hideAnimatedView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        hideAnimatedView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



class SwiftLoader:NSObject {
    static let shared = SwiftLoader()
    
    lazy var hideAnimatedView:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show", for: .normal)
        button.setTitleColor(.red, for: .normal)
        //            button.addTarget(self, action: #selector(showAnimatedView), for: .touchUpInside)
        return button
    }()
    
    func show(){
        print("Show progress leader")
        
        if let keyWindow = UIApplication.shared.keyWindow {
            let view = UIView(frame: keyWindow.frame)
            view.backgroundColor = .red
            view.frame = CGRect(x: keyWindow.frame.width - 10, y: keyWindow.frame.height - 10, width: 10, height: 10)
            view.tag = 2222
            
            let height = keyWindow.frame.width * 9 / 16
            let topViewFrame = CGRect(x: 0, y: 0, width: keyWindow.frame.width, height: height)
            let topVw = topView(frame: topViewFrame)
            view.addSubview(topVw)
            keyWindow.addSubview(view)
            
            // put duration value 0.5 to show view animated
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping:1, initialSpringVelocity:1,options: .curveEaseOut,
                           animations: {
                            view.frame = keyWindow.frame
            }) { (completedAnimation) in
                
                // may be will do something later
            }
            
        }
    }
    
   
    func hide(){
        if let keyWindow = UIApplication.shared.keyWindow {
            if let view = keyWindow.viewWithTag(2222) {
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping:1, initialSpringVelocity:1,options: .curveEaseOut,
                               animations: {
                    view.frame = CGRect(x: keyWindow.frame.width , y: keyWindow.frame.height, width:0, height: 0)

                }) { (completedAnimation) in
                    
                    // may be will do something later
                }
                
            }
        }
    }
}
