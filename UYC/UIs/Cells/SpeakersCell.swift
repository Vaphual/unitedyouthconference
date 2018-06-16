//
//  SpeakersCell.swift
//  UYC
//
//  Created by JubalThang on 3/6/18.
//  Copyright © 2018 United Youth. All rights reserved.
//

import UIKit

class SpeakersCell: UITableViewCell {
    
    let speakerImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.frame.size = CGSize (width: 78, height: 78)
        image.layer.cornerRadius = image.frame.width / 2
        image.layer.masksToBounds = true
        image.layer.borderWidth = 2
        image.layer.borderColor = UIColor.lightGray.cgColor
        image.contentMode = .scaleAspectFill
        image.layer.shadowColor = UIColor.black.cgColor
        image.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        return image
    }()
    
    let speakerName : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "SF-Pro-Display-Bold.otf", size: 16)
//        label.font = UIFont.systemFont(ofSize: 16)
//        label.backgroundColor = .red
        label.textAlignment = .left
        //        label.backgroundColor = UIColor.purple
        return label
    }()
    let speakersTitle: UILabel = {
        let textView = UILabel()
        textView.translatesAutoresizingMaskIntoConstraints = false
//        textView.font = UIFont(name: "SF-Pro-Display-Regular", size: 13)
        textView.font = UIFont.systemFont(ofSize: 15)
        //        textView.adjustsFontSizeToFitWidth = true
        textView.textColor = UIColor.gray
        
        textView.numberOfLines = 4
        //        textView.isEditable = false
        //        textView.isSelectable = false
        //        textView.backgroundColor = UIColor.cyan
        return textView
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        [speakerImage,speakerName,speakersTitle].forEach{addSubview($0)}
        
        speakerImage.anchor(top: nil, tailing: nil, bottom: nil, leading: self.leadingAnchor, centerX: nil, centerY: self.centerYAnchor, padding: .init(top: 6, left: 16, bottom: -6, right: 0))
        speakerImage.heightAnchor.constraint(equalToConstant: 78).isActive = true
        speakerImage.widthAnchor.constraint(equalToConstant: 78).isActive = true
        
        speakerName.anchor(top: self.topAnchor, tailing: self.trailingAnchor, bottom: nil, leading: speakerImage.trailingAnchor, centerX: nil, centerY: nil, padding: .init(top: 10, left: 28, bottom: 0, right: 0))
        speakerName.heightAnchor.constraint(equalToConstant: 38).isActive = true
        
        speakersTitle.anchor(top: speakerName.bottomAnchor, tailing: speakerName.trailingAnchor, bottom: self.bottomAnchor, leading: speakerName.leadingAnchor, centerX: nil, centerY: nil,padding: .init(top: 0, left: 0, bottom: -16, right: 0))
    }
    
}

