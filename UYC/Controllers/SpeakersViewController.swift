//
//  SpeakersViewController.swift
//  UYC
//
//  Created by JubalThang on 3/6/18.
//  Copyright © 2018 United Youth. All rights reserved.
//

import UIKit

class SpeakersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let speadersData = Speakers()
    
    let homeBtn: UIButton = {
        let button = HomeButton()
        button.addTarget(self, action: #selector(backToHome), for: .touchUpInside)
        return button
    }()
    
    
    let speakersTitleContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .white
        container.layer.shadowOpacity = 0.25
        container.layer.shadowOffset = CGSize(width: 0, height: 3)
        return container
    }()
    
    var speakersTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Speakers"
        label.font = UIFont.boldSystemFont(ofSize: 23)
        label.textAlignment = .center
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tablContainer : UIView = {
        let table = UIView()
        table.backgroundColor = .white
        table.translatesAutoresizingMaskIntoConstraints = false
        table.layer.shadowColor = UIColor.black.cgColor
        table.layer.shadowOpacity = 0.25
        table.layer.shadowOffset = CGSize.zero
        return table
    }()
    
    let speakersTableView: UITableView = {
        let table = UITableView(frame: .zero, style: UITableViewStyle.plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorInset = UIEdgeInsets(top: 0, left: 28, bottom: 0, right: 28)
        table.allowsSelection = true
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(backToHome))
        swipeLeft.direction = .right
        view.addGestureRecognizer(swipeLeft)
        
        view.backgroundColor = UIColor.backgroudnColor
        
        speakersTableView.delegate = self
        speakersTableView.dataSource = self
        
        [speakersTitleContainer,speakersTitleLabel,homeBtn,tablContainer].forEach{view.addSubview($0)}
        speakersTitleContainer.anchor(top: view.safeAreaLayoutGuide.topAnchor, tailing: view.safeAreaLayoutGuide.trailingAnchor, bottom: nil, leading: view.safeAreaLayoutGuide.leadingAnchor,centerX: nil,centerY: nil)
        speakersTitleContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125).isActive = true
        
        speakersTitleLabel.anchor(top: speakersTitleContainer.topAnchor, tailing: speakersTitleContainer.trailingAnchor, bottom: speakersTitleContainer.bottomAnchor, leading: speakersTitleContainer.leadingAnchor , centerX: nil, centerY: nil)
        
        NSLayoutConstraint.activate([
            homeBtn.centerYAnchor.constraint(equalTo: speakersTitleContainer.centerYAnchor),
            homeBtn.heightAnchor.constraint(equalTo: speakersTitleContainer.heightAnchor, multiplier: 0.35),
            homeBtn.widthAnchor.constraint(equalTo: speakersTitleContainer.heightAnchor, multiplier: 0.35),
            homeBtn.leadingAnchor.constraint(equalTo: speakersTitleContainer.leadingAnchor, constant: 23)
            ])
        tablContainer.anchor(top: speakersTitleContainer.bottomAnchor, tailing: speakersTitleContainer.trailingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: speakersTitleContainer.leadingAnchor, centerX: nil, centerY: nil, padding: .init(top: 16, left: 16, bottom: -16, right: -16))
        
        tablContainer.addSubview(speakersTableView)
        speakersTableView.anchor(top: tablContainer.topAnchor, tailing: tablContainer.trailingAnchor, bottom: tablContainer.bottomAnchor, leading: tablContainer.leadingAnchor, centerX: nil, centerY: nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return speadersData.speakersName_eng.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = SpeakersCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "cell") 
        cell.speakerImage.image = speadersData.speakersImage[indexPath.row]
        cell.speakerName.text = speadersData.speakersName_eng[indexPath.row]
        cell.speakersTitle.text =  speadersData.speakersTitle_eng[indexPath.row]
        return cell
    }
    /// ---------------- Added SpeakersDetails viewController and this block
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let speakerDetailsViewController = SpeakersDetailsViewController()
        speakerDetailsViewController.speakerImage.image = speadersData.speakersImage[indexPath.row]
        speakerDetailsViewController.speakersNameLabel.text = speadersData.speakersName_eng[indexPath.row]
        speakerDetailsViewController.speakersDetailsTitleLabel.text = "Biography"
 
        // ---  inject the speaker's bio -- ///
        speakerDetailsViewController.bioString = speadersData.speakersBio_eng[indexPath.row]
        
        present(speakerDetailsViewController, animated: true, completion: nil)
    }
    //////// ------------------
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    @objc func backToHome(){
        BackToHome().backtoHome(from: self)
    }
}

