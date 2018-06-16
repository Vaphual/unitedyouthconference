//
//  BottomContainer.swift
//  UYC
//
//  Created by JubalThang on 3/6/18.
//  Copyright © 2018 United Youth. All rights reserved.
//

import UIKit
class BottomContainer: UIView {
    
    let logo: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "title") )
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let bottomLabel: UILabel = {
        let label = UILabel()
        label.text = "Organized By"
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        
        backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        addSubview(logo)
        addSubview(bottomLabel)
        
        NSLayoutConstraint.activate([
            bottomLabel.bottomAnchor.constraint(equalTo: logo.topAnchor, constant: 6),
            bottomLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            bottomLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
            bottomLabel.heightAnchor.constraint(equalTo:self.heightAnchor, multiplier: 0.5)
            ])
        
        NSLayoutConstraint.activate([
            logo.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logo.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            logo.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.35),
            logo.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.35)
            ])
    }
}

