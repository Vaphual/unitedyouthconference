//
//  DayButtons.swift
//  UYC
//
//  Created by JubalThang on 3/8/18.
//  Copyright © 2018 United Youth. All rights reserved.
//

import UIKit
class DayButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupButton(){
        titleLabel?.textAlignment = .center
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel?.numberOfLines = 2
        backgroundColor = .white
        layer.cornerRadius = 20
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.25
        setTitleColor(UIColor.black, for: UIControlState.normal)
    }
}
