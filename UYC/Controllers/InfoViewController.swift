//
//  InfoViewController.swift
//  UYC
//
//  Created by JubalThang on 3/6/18.
//  Copyright © 2018 United Youth. All rights reserved.
//

import UIKit
class InfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let infoTitle = Information().infoTile
    let infoDetail = Information().infoDetails
    
    let backBtn: UIButton = {
        let button = HomeButton()
        button.addTarget(self, action: #selector(backToHome), for: .touchUpInside)
        return button
    }()
    
    
    let infoTitleContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .white
        container.layer.shadowOpacity = 0.25
        container.layer.shadowOffset = CGSize(width: 0, height: 3)
        return container
    }()
    
    var infoTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Information"
        label.font = UIFont.boldSystemFont(ofSize: 23)
        label.textAlignment = .center
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var infoTableView : UITableView = {
        let tv = UITableView(frame: .zero, style: UITableViewStyle.grouped)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tv.separatorColor = UIColor.red
        tv.allowsSelection = false
        tv.backgroundColor = .white
        return tv
    }()
    
    let imageView = UIImageView(image: #imageLiteral(resourceName: "header"))
    
    let paragraphStyle = NSMutableParagraphStyle()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.backgroudnColor
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(backToHome))
        swipeLeft.direction = .right
        view.addGestureRecognizer(swipeLeft)
        
        infoTableView.delegate = self
        infoTableView.dataSource = self
        
        paragraphStyle.firstLineHeadIndent = 30
        paragraphStyle.lineSpacing = 5
        paragraphStyle.alignment = .justified
        
        
        [infoTitleContainer,infoTitleContainer,infoTitleLabel,backBtn,infoTableView].forEach{view.addSubview($0)}
        
        infoTitleContainer.anchor(top: view.safeAreaLayoutGuide.topAnchor, tailing: view.safeAreaLayoutGuide.trailingAnchor, bottom: nil, leading: view.safeAreaLayoutGuide.leadingAnchor,centerX: nil,centerY: nil)
        infoTitleContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125).isActive = true
        
        infoTitleLabel.anchor(top: infoTitleContainer.topAnchor, tailing: infoTitleContainer.trailingAnchor, bottom: infoTitleContainer.bottomAnchor, leading: infoTitleContainer.leadingAnchor, centerX: nil, centerY: nil)
        NSLayoutConstraint.activate([
            backBtn.centerYAnchor.constraint(equalTo: infoTitleContainer.centerYAnchor),
            backBtn.heightAnchor.constraint(equalTo: infoTitleContainer.heightAnchor, multiplier: 0.35),
            backBtn.widthAnchor.constraint(equalTo: infoTitleContainer.heightAnchor, multiplier: 0.35),
            backBtn.leadingAnchor.constraint(equalTo: infoTitleContainer.leadingAnchor, constant: 23)
            ])
        infoTableView.anchor(top: infoTitleLabel.bottomAnchor, tailing: infoTitleLabel.trailingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: infoTitleLabel.leadingAnchor, centerX: nil, centerY: nil, padding: .init(top: 10, left: 8, bottom: 0, right: -8))
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return imageView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoTitle.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 160
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = InfoCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "infoCell")
        cell.infoTitle.text = infoTitle[indexPath.row]
        
        let bioDetailsAttributes = [NSAttributedStringKey.foregroundColor: UIColor.black, NSAttributedStringKey.paragraphStyle: paragraphStyle]
        cell.infoDetails.attributedText = NSAttributedString(string: infoDetail[indexPath.row], attributes: bioDetailsAttributes)
        //cell.infoDetails.text = infoDetail[indexPath.row]
        return cell
    }
    
    
    @objc func backToHome(){
        BackToHome().backtoHome(from: self)
    }
}


