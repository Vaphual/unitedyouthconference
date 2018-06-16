//
//  ViewController.swift
//  UYC
//
//  Created by JubalThang on 3/6/18.
//  Copyright © 2018 United Youth. All rights reserved.
//

import UIKit


class HomePageController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    let icons = [#imageLiteral(resourceName: "timetable"),#imageLiteral(resourceName: "register"),#imageLiteral(resourceName: "speakers"),#imageLiteral(resourceName: "giving"),#imageLiteral(resourceName: "location"),#imageLiteral(resourceName: "info")]
    
    let iconsLabels_eng = IconLabels().iconsLabel_eng
    
    
    /////////////////////////////// <-- TOP Session --> /////////////////////////
    
    let topContainer : TopContainer = {
        let top = TopContainer()
        top.translatesAutoresizingMaskIntoConstraints = false
        return top
    }()
    ////////////////////////////////<-- TOP Session End -->//////////
    
    ////////////// <-- Middle Session Start ---> /////////////////////
    let middleContainer: UIView = {
        let middle = UIView()
        middle.translatesAutoresizingMaskIntoConstraints = false
        middle.backgroundColor = .white
        middle.layer.cornerRadius = 10
        middle.layer.shadowColor = UIColor.black.cgColor
        //        middle.layer.shadowRadius = 10
        middle.layer.shadowOffset = CGSize(width: 1, height: 1)
        middle.layer.shadowOpacity = 0.25
        return middle
    }()
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 110)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return icons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! IconCell
        
        cell.iconView.image = icons[indexPath.item]
        cell.iconLabel.text = iconsLabels_eng[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.item {
        case 0:
            self.show(TimetableViewController(), sender: self)
//            let timeTableDetialView = TimetableViewController()
//            timeTableDetialView.modalTransitionStyle = .flipHorizontal
//            self.present(timeTableDetialView, animated: true, completion: nil)
        case 1:
            self.show(RegisterViewController(), sender: self)
        case 2:
            self.show(SpeakersViewController(), sender: self)
        case 3:
            self.show(GivingViewController(), sender: self)
        case 4:
            self.show(LocationMapViewController(), sender: self)
        case 5:
            self.show(InfoViewController(), sender: self)
        //            self.present(InfoViewController(), animated: true, completion: nil)
        default:
            print(indexPath.item)
        }
    }
    
    
    //   //////////////////// <-- Middle Session End --> ////////////////////
    
    ////    //////////// <-- Bottom Session Start --> ////////////////////////
    
    let bottomContainer: BottomContainer = {
        let bottom = BottomContainer()
        bottom.translatesAutoresizingMaskIntoConstraints = false
        return bottom
    }()
    //////////////////// <-- Bottom Session End-->/////////////////////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.backgroudnColor
        
        view.addSubview(topContainer)
        topContainer.anchor(top: view.safeAreaLayoutGuide.topAnchor, tailing: view.safeAreaLayoutGuide.trailingAnchor, bottom: nil, leading: view.safeAreaLayoutGuide.leadingAnchor,centerX: nil,centerY: nil)
        topContainer.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        let iconsCollectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            let icons = UICollectionView(frame: .zero, collectionViewLayout: layout)
            icons.delegate = self
            icons.dataSource = self
            icons.register(IconCell.self, forCellWithReuseIdentifier: "cell")
            icons.backgroundColor = .clear
            return icons
        }()
        
        view.addSubview(middleContainer)
        middleContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 180).isActive = true
        middleContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -120).isActive = true
        middleContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        middleContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        
        middleContainer.addSubview(iconsCollectionView)
        iconsCollectionView.anchor(top: middleContainer.topAnchor, tailing: middleContainer.trailingAnchor, bottom: middleContainer.bottomAnchor, leading: middleContainer.leadingAnchor, centerX: nil, centerY: nil,padding: .init(top: 16, left: 16, bottom: -16, right: -16))
        
        view.addSubview(bottomContainer)
        bottomContainer.anchor(top: nil, tailing: view.safeAreaLayoutGuide.trailingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, centerX: nil,centerY: nil)
        bottomContainer.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    
}
