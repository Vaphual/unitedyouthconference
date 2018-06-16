//
//  InfoCell.swift
//  UYC
//
//  Created by JubalThang on 3/12/18.
//  Copyright © 2018 United Youth. All rights reserved.
//

import UIKit
class InfoCell: UITableViewCell {
    
    let infoTitle : UILabel = {
        let tv = UILabel()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.font = UIFont.boldSystemFont(ofSize: 15)
        tv.backgroundColor = .red
        tv.textColor = .white
        return tv
    }()
    
    let infoTitleContainer: UIView = {
       let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    let infoDetails : UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.isSelectable = false
        tv.isEditable = false
        tv.isScrollEnabled = false
        tv.textAlignment = .justified
        return tv
    }()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupInfoCell()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupInfoCell(){
        
        [infoTitleContainer,infoDetails,infoTitle].forEach{addSubview($0)}
        
//        infoTitleContainer.anchor(top: self.topAnchor, tailing: self.trailingAnchor, bottom: nil, leading: self.leadingAnchor, centerX: nil, centerY: nil,size: .zero,padding: .init(top: 8, left: 6, bottom: 0, right: -6))

        infoTitleContainer.anchor(top: topAnchor, tailing: trailingAnchor, bottom: nil, leading: leadingAnchor, centerX: nil, centerY: nil)
        infoTitleContainer.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        infoTitle.anchor(top: nil, tailing: infoTitleContainer.trailingAnchor, bottom: nil, leading: infoTitleContainer.leadingAnchor, centerX: nil, centerY: infoTitleContainer.centerYAnchor)
        
        infoDetails.anchor(top: infoTitleContainer.bottomAnchor, tailing: self.trailingAnchor, bottom: nil, leading: self.leadingAnchor, centerX: nil, centerY: nil,padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        infoDetails.heightAnchor.constraint(equalTo: infoDetails.heightAnchor, multiplier: 100)
        
        backgroundColor = .white
    }
}
