//
//  TableCell.swift
//  UYC
//
//  Created by JubalThang on 3/6/18.
//  Copyright © 2018 United Youth. All rights reserved.
//

import UIKit
class TableCell: UITableViewCell{
    
    let line : UIImageView = {
        let line = UIImageView(image: #imageLiteral(resourceName: "line"))
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    internal let timeContainer : UIView = {
        let time = UIView()
        time.backgroundColor = .white
        time.translatesAutoresizingMaskIntoConstraints = false
        return time
    }()
    internal let sessionContainer : UIView = {
        let sessions = UIView()
        sessions.backgroundColor = UIColor.tableCellSessionBgColor
        sessions.translatesAutoresizingMaskIntoConstraints = false
        return sessions
    }()
    internal var table_timeLable : UILabel = {
        let time = UILabel()
        time.text = "6:00 - 6:00 AM"
        time.font = UIFont.boldSystemFont(ofSize: 14)
        time.textAlignment = .left
        time.translatesAutoresizingMaskIntoConstraints = false
        return time
    }()
    internal var sessinName : UILabel = {
        let session = UILabel()
        session.backgroundColor = UIColor.tableCellSessionBgColor
        session.font = UIFont.boldSystemFont(ofSize: 16)
        session.textAlignment = .left
        session.text = "Door Opening"
        session.translatesAutoresizingMaskIntoConstraints = false
        return session
    }()
    
    internal var sessionHours = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupRow()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    internal func setupRow(){
        [sessionContainer,sessinName,line].forEach{addSubview($0)}
        
        //        timeContainer.anchor(top: self.topAnchor, tailing: self.trailingAnchor, bottom: self.bottomAnchor, leading: self.leadingAnchor,padding: .init(top: 0, left: 0, bottom: -50, right: 0))
        //        table_timeLable.anchor(top: timeContainer.topAnchor, tailing: timeContainer.trailingAnchor, bottom: timeContainer.bottomAnchor, leading: timeContainer.leadingAnchor, padding: .init(top: 6, left: 16, bottom: -6, right: -16))
        
        line.anchor(top: sessionContainer.topAnchor, tailing: nil, bottom: sessionContainer.bottomAnchor, leading: sessionContainer.leadingAnchor, centerX: nil, centerY: nil, padding: UIEdgeInsets.init(top: 9, left: 16, bottom: -9, right: 0))
        line.widthAnchor.constraint(equalToConstant: 3).isActive = true
        
        sessionContainer.anchor(top: self.topAnchor, tailing: self.trailingAnchor, bottom: self.bottomAnchor, leading: self.leadingAnchor, centerX: nil, centerY: nil)
        sessinName.anchor(top: sessionContainer.topAnchor, tailing: sessionContainer.trailingAnchor, bottom: sessionContainer.bottomAnchor, leading: line.trailingAnchor, centerX: nil, centerY: nil, padding: .init(top: 6, left: 9, bottom: -6, right: -16))
    }
}

