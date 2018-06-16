//
//  SpeakersDetailsViewController
//  HomePageFinal
//
//  Created by JubalThang on 2/28/18.
//  Copyright © 2018 JubalThang. All rights reserved.
//

import UIKit
class SpeakersDetailsViewController: UIViewController {
    
    let backBtn: UIButton = {
        let button = BackButton()
        button.addTarget(self, action: #selector(backToPrevious), for: .touchUpInside)
        return button
    }()
    
    // --- To hold speaker's bio --///
    var bioString: String = {
        let string = String()
        return string
    }()
    
    /**
     Please keep in mind, when working with fonts it's preferable to use Dynamic Type where possible so that a user's font size settings are honored. The example code below creates an attributed string using the "Headline" Dynamic Type size, then colors it purple. That is then placed into a UILabel by setting its attributedText property:
     
     let titleAttributes = [NSAttributedStringKey.font: UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline), NSAttributedStringKey.foregroundColor: UIColor.purple]
     
     let titleString = NSAttributedString(string: "Read all about it!", attributes: titleAttributes)
     yourLabel.attributedText = titleString
     */
    ////---
   
    let speakersDetailsViewContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .white
        container.layer.shadowOpacity = 0.25
        container.layer.shadowOffset = CGSize(width: 0, height: 3)
        return container
    }()
    
    var speakerImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "speakers"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.frame.size = CGSize (width: 130, height: 130)
        image.layer.cornerRadius = image.frame.width / 2
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.masksToBounds = true
        image.backgroundColor = .red
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let speakersDetailsTitleContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .white
        container.layer.shadowOpacity = 0.25
        container.layer.shadowOffset = CGSize(width: 0, height: 3)
        return container
    }()
    
    var speakersDetailsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.textAlignment = .center
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var speakersNameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.textAlignment = .center
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let speakersDetailsContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.9254901961, blue: 0.9254901961, alpha: 1)
        container.layer.shadowOpacity = 0.25
        container.layer.shadowOffset = CGSize(width: 0, height: 3)
        return container
    }()
    

    // Speaker details Text Container
    var speakersDetailsTextField: UITextView = {
        let textField = UITextView()
        textField.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.9254901961, blue: 0.9254901961, alpha: 1)
        textField.isEditable = false
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.backgroudnColor
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(backToPrevious))
        swipeLeft.direction = .right
        view.addGestureRecognizer(swipeLeft)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.firstLineHeadIndent = 30
        paragraphStyle.lineSpacing = 5
        paragraphStyle.alignment = .justified
        
         let bioDetailsAttributes = [NSAttributedStringKey.foregroundColor: UIColor.black, NSAttributedStringKey.paragraphStyle: paragraphStyle]
        
        let bioAttributed = NSAttributedString(string: bioString, attributes: bioDetailsAttributes)
        
        
        speakersDetailsTextField.attributedText = bioAttributed
        [speakersDetailsViewContainer,speakerImage,speakersDetailsTitleContainer,speakersDetailsTitleLabel,backBtn,speakersDetailsContainer, speakersDetailsTextField,speakersNameLabel].forEach{view.addSubview($0)}
        
        
        speakersDetailsTitleContainer.anchor(top: view.safeAreaLayoutGuide.topAnchor, tailing: view.safeAreaLayoutGuide.trailingAnchor, bottom: nil, leading: view.safeAreaLayoutGuide.leadingAnchor,centerX: nil,centerY: nil)
        speakersDetailsTitleContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125).isActive = true
    
        
        /// ---------------- Main Container ---------------- ////
        speakersDetailsViewContainer.anchor(top: speakersDetailsTitleLabel.bottomAnchor, tailing: view.safeAreaLayoutGuide.trailingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor,centerX: nil, centerY: nil,size: CGSize.zero, padding: UIEdgeInsets(top: 10, left: 10, bottom: -10, right: -10))
        ///////////////////////////////////////
        
        //////////// -------- Name Label ----------- //////////////
        NSLayoutConstraint.activate([
            speakersNameLabel.centerXAnchor.constraint(equalTo: speakersDetailsViewContainer.centerXAnchor),
            speakersNameLabel.heightAnchor.constraint(equalToConstant: 50),
            speakersNameLabel.widthAnchor.constraint(equalTo: speakersDetailsViewContainer.widthAnchor, multiplier: 0.9),
            speakersNameLabel.topAnchor.constraint(equalTo: speakerImage.bottomAnchor , constant: 10)
            ])
        
        speakerImage.anchor(top: speakersDetailsViewContainer.topAnchor, tailing: nil, bottom: nil, leading: nil, centerX: speakersDetailsViewContainer.centerXAnchor, centerY: nil,padding: UIEdgeInsets.init(top: 10, left: 0, bottom: 0, right: 0))
        speakerImage.heightAnchor.constraint(equalToConstant: speakerImage.frame.height).isActive = true
        speakerImage.widthAnchor.constraint(equalToConstant: speakerImage.frame.width).isActive = true
        
        
        speakersDetailsTitleLabel.anchor(top: speakersDetailsTitleContainer.topAnchor, tailing: speakersDetailsTitleContainer.trailingAnchor, bottom: speakersDetailsTitleContainer.bottomAnchor, leading: speakersDetailsTitleContainer.leadingAnchor, centerX: nil, centerY: nil)
        
        NSLayoutConstraint.activate([
            backBtn.centerYAnchor.constraint(equalTo: speakersDetailsTitleContainer.centerYAnchor),
            backBtn.heightAnchor.constraint(equalTo: speakersDetailsTitleContainer.heightAnchor, multiplier: 0.35),
            backBtn.widthAnchor.constraint(equalTo: speakersDetailsTitleContainer.heightAnchor, multiplier: 0.35),
            backBtn.leadingAnchor.constraint(equalTo: speakersDetailsTitleContainer.leadingAnchor, constant: 23)
            ])
        
        /// ------- Speaker details container ---- //////
        speakersDetailsContainer.anchor(top: speakersNameLabel.bottomAnchor, tailing: speakersDetailsViewContainer.trailingAnchor, bottom: speakersDetailsViewContainer.bottomAnchor, leading: speakersDetailsViewContainer.leadingAnchor, centerX: nil, centerY: nil)
        
        /// -------  Speaker detials TextField ---- //////
        speakersDetailsTextField.anchor(top: speakersDetailsContainer.topAnchor, tailing: speakersDetailsContainer.trailingAnchor, bottom: speakersDetailsContainer.bottomAnchor, leading: speakersDetailsContainer.leadingAnchor, centerX: nil, centerY: nil, size: CGSize.zero, padding: UIEdgeInsets(top: 20, left: 20, bottom: -20, right: -20))
        
    }
    
    @objc func backToPrevious(){
       dismiss(animated: true, completion: nil)
    }
}


