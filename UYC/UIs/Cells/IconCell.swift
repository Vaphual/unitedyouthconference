//
//  IconCell.swift
//  UYC
//
//  Created by JubalThang on 3/6/18.
//  Copyright © 2018 United Youth. All rights reserved.
//

import UIKit
class IconCell: UICollectionViewCell{
    
    let iconView:UIImageView = {
        let icon = UIImageView(image: #imageLiteral(resourceName: "register"))
        icon.contentMode = .scaleAspectFit
        icon.alpha = 0.5
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    let iconLabel: UILabel = {
        let label = UILabel()
        label.text = "Information"
//        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.font = UIFont(name: "SF-Pro-Display-Bold", size: 14)
        label.textColor = UIColor.black
        //        label.numberOfLines = 2
        label.textAlignment = .center
//        label.backgroundColor = UIColor.lightGray
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
        backgroundColor = .clear
        addSubview(iconView)
        iconView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        iconView.heightAnchor.constraint(equalToConstant: 65).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: 65).isActive = true
        iconView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        addSubview(iconLabel)
        iconLabel.topAnchor.constraint(equalTo: iconView.bottomAnchor).isActive = true
        iconLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        iconLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        iconLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}


