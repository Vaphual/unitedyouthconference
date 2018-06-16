//
//  GivingViewController.swift
//  UYC
//
//  Created by JubalThang on 3/6/18.
//  Copyright © 2018 United Youth. All rights reserved.
//
import UIKit
import WebKit
class GivingViewController: UIViewController, WKNavigationDelegate {
    
    let activityIndicator = UIActivityIndicatorView()
    
    let givingWebView: WKWebView = {
        let webView = WKWebView(frame: CGRect.zero, configuration: WKWebViewConfiguration())
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    let backBtn: UIButton = {
        let button = HomeButton()
        button.addTarget(self, action: #selector(backToHome), for: .touchUpInside)
        return button
    }()
    
    
    let givingTitleContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .white
        container.layer.shadowOpacity = 0.25
        container.layer.shadowOffset = CGSize(width: 0, height: 3)
        return container
    }()
    
    var givingTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Faith Promise for 2019"
        label.font = UIFont.boldSystemFont(ofSize: 23)
        label.textAlignment = .center
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.backgroudnColor
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(backToHome))
        swipeLeft.direction = .right
        view.addGestureRecognizer(swipeLeft)
        
        givingWebView.navigationDelegate = self
        
        [givingTitleContainer,givingTitleContainer,givingTitleLabel,backBtn,givingWebView].forEach{view.addSubview($0)}
        
        givingTitleContainer.anchor(top: view.safeAreaLayoutGuide.topAnchor, tailing: view.safeAreaLayoutGuide.trailingAnchor, bottom: nil, leading: view.safeAreaLayoutGuide.leadingAnchor,centerX: nil,centerY: nil)
        givingTitleContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125).isActive = true
        
        givingTitleLabel.anchor(top: givingTitleContainer.topAnchor, tailing: givingTitleContainer.trailingAnchor, bottom: givingTitleContainer.bottomAnchor, leading: givingTitleContainer.leadingAnchor, centerX: nil, centerY: nil)
        NSLayoutConstraint.activate([
            backBtn.centerYAnchor.constraint(equalTo: givingTitleContainer.centerYAnchor),
            backBtn.heightAnchor.constraint(equalTo: givingTitleContainer.heightAnchor, multiplier: 0.35),
            backBtn.widthAnchor.constraint(equalTo: givingTitleContainer.heightAnchor, multiplier: 0.35),
            backBtn.leadingAnchor.constraint(equalTo: givingTitleContainer.leadingAnchor, constant: 23)
            ])
        
        givingWebView.anchor(top: givingTitleContainer.bottomAnchor, tailing: givingTitleContainer.trailingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: givingTitleContainer.leadingAnchor, centerX: nil, centerY: nil,padding: .init(top: 16, left: 0, bottom: 0, right: 0))
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        let url = URL(string: WebLinks().givingLink)
        let urlRequest = URLRequest(url: url!)
        givingWebView.load(urlRequest)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = .gray
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        activityIndicator.stopAnimating()
    }
    @objc func backToHome(){
        BackToHome().backtoHome(from: self)
    }
}


