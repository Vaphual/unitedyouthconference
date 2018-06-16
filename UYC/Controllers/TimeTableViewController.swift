//
//  TimeTableViewController.swift
//  UYC
//
//  Created by JubalThang on 3/6/18.
//  Copyright © 2018 United Youth. All rights reserved.
//

import UIKit
class TimetableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let timeTableDetialView = TimeTableDetails()
    
    var dayButtons = [DayButton]()
    
    var dayCounts = ["THU\n4","FRI\n5","SAT\n6","SUN\n7"]    // This is to create DayButtons -- @ has to be update at stackview to display on screen
    
    let dailySchedule = DailySchedules()
    
    var forHeader = [""]
    var forSection = [[(String)]]()
    var forDetails = [[(String)]]()
    
    //// ----------------------------------- Views --------------------------- /////////
    let homeBtn: UIButton = {
        let button = HomeButton()
        button.addTarget(self, action: #selector(backToHome), for: UIControlEvents.touchUpInside)
        return button
    }()
    
    let titleContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .white
        container.layer.shadowOpacity = 0.25
        container.layer.shadowOffset = CGSize(width: 0, height: 3)
        return container
    }()
    
    let timeTabletitle: UILabel = {
        let label = UILabel()
        label.text = "Time Table"
        label.font = UIFont.boldSystemFont(ofSize: 23)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let tableContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .white
        container.layer.shadowOpacity = 0.25
        container.layer.shadowOffset = CGSize.zero
        return container
    }()
    let timeTableView : UITableView = {
        let table = UITableView(frame: .zero, style: UITableViewStyle.plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .white
        table.separatorColor = .white
        return table
    }()
    /////////// --------------------------- ----------------------- //////////////////
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor =  UIColor.backgroudnColor
        
        timeTableView.dataSource = self
        timeTableView.delegate = self
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(backToHome))
        swipeLeft.direction = .right
        view.addGestureRecognizer(swipeLeft)
        
        forHeader = dailySchedule.dayOneTimeSchedules
        forSection = dailySchedule.dayOneSessionsSchedules
        forDetails = dailySchedule.dayOneDetails
        
       
        
        //TODO: Move to Data
        
        for day in 0..<dayCounts.count {
            let dayBtn = DayButton()
            dayBtn.setTitle(dayCounts[day], for: UIControlState.normal)
            dayBtn.addTarget(self, action: #selector(buttonSelected), for: UIControlEvents.touchUpInside)
            dayButtons.append(dayBtn)
        }
        
        let buttonsStackView = UIStackView(arrangedSubviews: [dayButtons[0],dayButtons[1],dayButtons[2],dayButtons[3]])
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.spacing = 10
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.setCustomSpacing(23, after: dayButtons[0])
        buttonsStackView.setCustomSpacing(23, after: dayButtons[1])
        buttonsStackView.setCustomSpacing(23, after: dayButtons[2])
        
        dayButtons[0].isSelected = true
        dayButtons[0].backgroundColor = UIColor.buttonSelectedColor
        dayButtons[0].layer.shadowOpacity = 0
        dayButtons[0].setTitleColor(UIColor.white, for: UIControlState.normal)
        
        [titleContainer,homeBtn,timeTabletitle,buttonsStackView,tableContainer,timeTableView].forEach{view.addSubview($0)}
        
        NSLayoutConstraint.activate([
            titleContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            titleContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            titleContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125)
            ])
        
        
        NSLayoutConstraint.activate([
            homeBtn.centerYAnchor.constraint(equalTo: titleContainer.centerYAnchor),
            homeBtn.heightAnchor.constraint(equalTo: titleContainer.heightAnchor, multiplier: 0.35),
            homeBtn.widthAnchor.constraint(equalTo: titleContainer.heightAnchor, multiplier: 0.35),
            homeBtn.leadingAnchor.constraint(equalTo: titleContainer.leadingAnchor, constant: 23)
            ])
        
        NSLayoutConstraint.activate([
            timeTabletitle.topAnchor.constraint(equalTo: titleContainer.topAnchor),
            timeTabletitle.leadingAnchor.constraint(equalTo: titleContainer.leadingAnchor, constant: 10),
            timeTabletitle.trailingAnchor.constraint(equalTo: titleContainer.trailingAnchor),
            timeTabletitle.bottomAnchor.constraint(equalTo: titleContainer.bottomAnchor)
            ])
        
        
        buttonsStackView.anchor(top: titleContainer.bottomAnchor, tailing: view.safeAreaLayoutGuide.trailingAnchor, bottom: nil, leading: view.safeAreaLayoutGuide.leadingAnchor, centerX: nil, centerY: nil, size: .init(width: 0, height: 200), padding: .init(top: 20, left: 24, bottom: 0, right: -24))
        
        tableContainer.anchor(top: buttonsStackView.bottomAnchor, tailing: view.safeAreaLayoutGuide.trailingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, centerX: nil, centerY: nil, size: .zero, padding: .init(top: 20, left: 16, bottom: -16, right: -16))
        timeTableView.anchor(top: tableContainer.topAnchor, tailing: tableContainer.trailingAnchor, bottom: tableContainer.bottomAnchor, leading: tableContainer.leadingAnchor, centerX: nil, centerY: nil, size: CGSize.zero, padding: .zero)
    }
    
    
    //MARK: Button select
    
    @objc func buttonSelected(currentBtn: UIButton){
        
        for button in dayButtons {
            if  button.isSelected && button != currentBtn {
                button.backgroundColor = UIColor.white
                button.layer.shadowOpacity = 0.25
                button.setTitleColor(UIColor.black, for: UIControlState.normal)
                
            }
        }
        currentBtn.isSelected = true
        currentBtn.backgroundColor = UIColor.buttonSelectedColor
        currentBtn.layer.shadowOpacity = 0
        currentBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        
        if let day = currentBtn.currentTitle{
            createTable(at: day)
        }
        
    }
    
    func createTable(at day: String) {
        
        switch day {
        case "THU\n4":
            forHeader = dailySchedule.dayOneTimeSchedules
            forSection = dailySchedule.dayOneSessionsSchedules
            forDetails = dailySchedule.dayOneDetails
            timeTableView.reloadData()
        case "FRI\n5":
            
            forHeader = dailySchedule.dayTwoTimeSchedules
            forSection = dailySchedule.dayTwoSessionsSchedules
            forDetails = dailySchedule.dayTwoDetails
            timeTableView.reloadData()
        case "SAT\n6":
            
            forHeader = dailySchedule.dayThreeTimeSchedules
            forSection = dailySchedule.dayThreeSessionsSchedules
            forDetails = dailySchedule.dayThreeDetails
            timeTableView.reloadData()
        case "SUN\n7":
            
            forHeader = dailySchedule.dayFourTimeSchedules
            forSection = dailySchedule.dayFourSessionsSchedules
            forDetails = dailySchedule.dayFourDetails
            timeTableView.reloadData()
        default : print("no button is selected")
            
        }
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return forSection.count
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UILabel()
        header.text = forHeader[section]
        header.font = UIFont.boldSystemFont(ofSize: 14)
        header.textAlignment = .center
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forSection[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.backgroundColor = UIColor.tableCellSessionBgColor
        cell.sessinName.text = forSection[indexPath.section][indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        timeTableDetialView.timeTableDetailTitle.text = forSection[indexPath.section][indexPath.row]
        timeTableDetialView.time.text = forHeader[indexPath.section]
        timeTableDetialView.detailDescriptionLabel.text = forDetails[indexPath.section][indexPath.row]
        
        // MARK: Load Page
        timeTableDetialView.modalTransitionStyle = .flipHorizontal
        self.present(timeTableDetialView, animated: true, completion: nil)
//        self.showDetailViewController(timeTableDetialView, sender: self)
    }
    @objc func backToHome(){
        BackToHome().backtoHome(from: self)
    }
    
}
