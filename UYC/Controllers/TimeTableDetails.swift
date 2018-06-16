//
//  TimeTableDetails.swift
//  UYC
//
//  Created by JubalThang on 3/6/18.
//  Copyright © 2018 United Youth. All rights reserved.
//

import UIKit

class TimeTableDetails: UIViewController {
    
    let topLine : UIImageView = {
        let line = UIImageView(image: #imageLiteral(resourceName: "line"))
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    let bottomLine : UIImageView = {
        let line = UIImageView(image: #imageLiteral(resourceName: "line"))
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    let backBtn: UIButton = {
        let button = BackButton()
        button.addTarget(self, action: #selector(backtoPrevious), for: .touchUpInside)
        return button
    }()
    
    let detailTitleContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .white
        container.layer.shadowOpacity = 0.25
        container.layer.shadowOffset = CGSize(width: 0, height: 3)
        return container
    }()
    
    let timeContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .white
        container.layer.shadowOpacity = 0.5
        container.layer.shadowOffset = CGSize(width: 0, height: 3)
        container.layer.cornerRadius = 15
        return container
    }()
    
    var time: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var timeTableDetailTitle: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 23)
        label.textAlignment = .center
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let timeDetialContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .white
        container.layer.shadowOpacity = 0.25
        container.layer.shadowOffset = CGSize(width: 0, height: 3)
        return container
    }()
    
    let descriptionLabel : UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var detialDescriptionContainer : UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = UIColor.tableCellSessionBgColor
        return container
    }()
    
    var detailDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Some Info"
        label.numberOfLines = 0
        label.font = UIFont(name: "SF-Pro-Display-Regular", size: 18)
//        label.textAlignment = .center
//        label.adjustsFontSizeToFitWidth = true
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.backgroudnColor
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(backtoPrevious))
        
        swipeLeft.direction = .right
        view.addGestureRecognizer(swipeLeft)
        
        [detailTitleContainer,timeTableDetailTitle,backBtn,timeContainer,timeDetialContainer, descriptionLabel].forEach{view.addSubview($0)}
        
        
        NSLayoutConstraint.activate([
            detailTitleContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailTitleContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            detailTitleContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            detailTitleContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125)
            ])
        
        NSLayoutConstraint.activate([
            backBtn.centerYAnchor.constraint(equalTo: detailTitleContainer.centerYAnchor),
            backBtn.heightAnchor.constraint(equalTo: detailTitleContainer.heightAnchor, multiplier: 0.35),
            backBtn.widthAnchor.constraint(equalTo: detailTitleContainer.heightAnchor, multiplier: 0.35),
            backBtn.leadingAnchor.constraint(equalTo: detailTitleContainer.leadingAnchor, constant: 23)
            ])

        timeTableDetailTitle.anchor(top:detailTitleContainer.topAnchor , tailing: detailTitleContainer.trailingAnchor, bottom: detailTitleContainer.bottomAnchor, leading: detailTitleContainer.leadingAnchor, centerX: nil, centerY: nil)
        
        timeContainer.anchor(top: detailTitleContainer.bottomAnchor, tailing: detailTitleContainer.trailingAnchor, bottom: nil, leading: detailTitleContainer.leadingAnchor, centerX: nil, centerY: nil,padding: .init(top: 30, left: 16, bottom: 0, right: -16))
        timeContainer.heightAnchor.constraint(equalToConstant: 65).isActive = true
        timeContainer.addSubview(time)
        time.anchor(top: nil, tailing: nil, bottom: nil, leading: nil, centerX: timeContainer.centerXAnchor, centerY: timeContainer.centerYAnchor)
        
        timeDetialContainer.anchor(top: timeContainer.bottomAnchor, tailing: timeContainer.trailingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: timeContainer.leadingAnchor, centerX: nil, centerY: nil,padding: .init(top: 20, left: 0, bottom: -24, right: 0))
        
        [descriptionLabel,detialDescriptionContainer,detailDescriptionLabel,topLine,bottomLine].forEach{timeDetialContainer.addSubview($0)}
        descriptionLabel.anchor(top: timeDetialContainer.topAnchor, tailing: timeDetialContainer.trailingAnchor, bottom: nil, leading: timeDetialContainer.leadingAnchor, centerX: nil, centerY: nil)
        descriptionLabel.heightAnchor.constraint(equalToConstant: 58).isActive = true
        
        detialDescriptionContainer.anchor(top: descriptionLabel.bottomAnchor, tailing: timeDetialContainer.trailingAnchor, bottom: detailDescriptionLabel.bottomAnchor, leading: timeDetialContainer.leadingAnchor, centerX: nil, centerY: nil,padding: .init(top: 0, left: 0, bottom: detailDescriptionLabel.frame.height+30, right: 0))
        
        topLine.anchor(top: detialDescriptionContainer.topAnchor, tailing: detialDescriptionContainer.trailingAnchor, bottom: nil, leading: detialDescriptionContainer.leadingAnchor, centerX: nil, centerY: nil, padding: .init(top: 16, left: 24, bottom: 0, right: -24))
        topLine.heightAnchor.constraint(equalToConstant: 3).isActive = true
        
        detailDescriptionLabel.anchor(top: topLine.bottomAnchor, tailing: detialDescriptionContainer.trailingAnchor, bottom: nil, leading: detialDescriptionContainer.leadingAnchor, centerX: nil, centerY: nil, padding: .init(top: 24, left: 24, bottom: -24, right: -24))
        
        bottomLine.anchor(top: detailDescriptionLabel.bottomAnchor, tailing: detialDescriptionContainer.trailingAnchor, bottom: nil, leading: detialDescriptionContainer.leadingAnchor, centerX: nil, centerY: nil, padding: .init(top: 16, left: 24, bottom: -16, right: -24))
        bottomLine.heightAnchor.constraint(equalToConstant: 3).isActive = true
    }
    
    
    
    @objc func backtoPrevious(){

        //MARK: Return to previous Page
        dismiss(animated: true, completion: nil)
//        self.showDetailViewController(TimetableViewController(), sender: self)

    }
}
