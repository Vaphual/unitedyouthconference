//
//  RegisterViewController.swift
//  UYC
//
//  Created by JubalThang on 3/6/18.
//  Copyright © 2018 United Youth. All rights reserved.
//


import UIKit
import WebKit
class RegisterViewController: UIViewController, WKNavigationDelegate {
    
    let activityIndicator = UIActivityIndicatorView()
    
    let registerWebView: WKWebView = {
        let webView = WKWebView(frame: CGRect.zero, configuration: WKWebViewConfiguration())
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    let backBtn: UIButton = {
        let button = HomeButton()
        button.addTarget(self, action: #selector(backToHome), for: .touchUpInside)
        return button
    }()
    
    
    let registerTitleContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .white
        container.layer.shadowOpacity = 0.25
        container.layer.shadowOffset = CGSize(width: 0, height: 3)
        return container
    }()
    
    var registerTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Register for 2018"
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
        
        [registerTitleContainer,registerTitleContainer,registerTitleLabel,backBtn,registerWebView].forEach{view.addSubview($0)}
        
        registerTitleContainer.anchor(top: view.safeAreaLayoutGuide.topAnchor, tailing: view.safeAreaLayoutGuide.trailingAnchor, bottom: nil, leading: view.safeAreaLayoutGuide.leadingAnchor,centerX: nil,centerY: nil)
        registerTitleContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125).isActive = true
        
        
        registerTitleLabel.anchor(top: registerTitleContainer.topAnchor, tailing: registerTitleContainer.trailingAnchor, bottom: registerTitleContainer.bottomAnchor, leading: registerTitleContainer.leadingAnchor, centerX: nil, centerY: nil)
        NSLayoutConstraint.activate([
            backBtn.centerYAnchor.constraint(equalTo: registerTitleContainer.centerYAnchor),
            backBtn.heightAnchor.constraint(equalTo: registerTitleContainer.heightAnchor, multiplier: 0.35),
            backBtn.widthAnchor.constraint(equalTo: registerTitleContainer.heightAnchor, multiplier: 0.35),
            backBtn.leadingAnchor.constraint(equalTo: registerTitleContainer.leadingAnchor, constant: 23)
            ])
        
        
        registerWebView.navigationDelegate = self
        
        registerWebView.anchor(top: registerTitleContainer.bottomAnchor, tailing: registerTitleContainer.trailingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: registerTitleContainer.leadingAnchor, centerX: nil, centerY: nil,padding: .init(top: 16, left: 0, bottom: 0, right: 0))
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        let url = URL(string: WebLinks().registerLink )
        let urlRequest = URLRequest(url: url!)
        registerWebView.load(urlRequest)
    }
    @objc func backToHome(){
        BackToHome().backtoHome(from: self)
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
}

