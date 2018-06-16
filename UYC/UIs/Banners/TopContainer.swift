//
//  TopContainer.swift
//  UYC
//
//  Created by JubalThang on 3/6/18.
//  Copyright © 2018 United Youth. All rights reserved.
//

import UIKit
class TopContainer: UIView{
    
    let banner: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "header"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        //        backgroundColor = .clear
        addSubview(banner)
        NSLayoutConstraint.activate([
            banner.topAnchor.constraint(equalTo: self.topAnchor),
            banner.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            banner.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            banner.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
        
        
    }
}
