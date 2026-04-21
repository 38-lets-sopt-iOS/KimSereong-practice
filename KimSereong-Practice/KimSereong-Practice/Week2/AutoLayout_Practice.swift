//
//  AutoLayout_Practice.swift
//  KimSereong-Practice
//
//  Created by 김세령 on 4/21/26.
//

import UIKit

class AutoLayout_Practice: UIViewController {
    let yellow : UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    let green : UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    let black : UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    let blue : UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUI()
        setLayout()
        
    }
    
    func setUI() {
        view.addSubview(yellow)
        view.addSubview(green)
        view.addSubview(black)
        view.addSubview(blue)
        
        yellow.translatesAutoresizingMaskIntoConstraints = false
        green.translatesAutoresizingMaskIntoConstraints = false
        blue.translatesAutoresizingMaskIntoConstraints = false
        black.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func setLayout() {
        NSLayoutConstraint.activate([
            yellow.topAnchor.constraint(equalTo: view.topAnchor),
            yellow.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            yellow.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            yellow.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),
            
            green.topAnchor.constraint(equalTo: yellow.bottomAnchor),
            green.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            green.widthAnchor.constraint(equalTo: yellow.widthAnchor),
            green.heightAnchor.constraint(equalTo: yellow.heightAnchor),
            
            black.topAnchor.constraint(equalTo: green.bottomAnchor),
            black.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            black.widthAnchor.constraint(equalTo: yellow.widthAnchor),
            black.heightAnchor.constraint(equalTo: yellow.heightAnchor),
            
            blue.topAnchor.constraint(equalTo: black.bottomAnchor),
            blue.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blue.widthAnchor.constraint(equalTo: yellow.widthAnchor),
            blue.heightAnchor.constraint(equalTo: yellow.heightAnchor),
            
            ])
        
    }
}
