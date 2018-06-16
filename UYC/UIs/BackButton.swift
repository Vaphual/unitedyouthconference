//
//  HomeButton.swift
//  UYC
//
//  Created by JubalThang on 3/30/18.
//  Copyright © 2018 unitedyouth. All rights reserved.
//

import UIKit
class BackButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton(){
        setImage(#imageLiteral(resourceName: "arrow_back"), for: UIControlState.normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
