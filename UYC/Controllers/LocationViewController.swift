//
//  LocationViewController.swift
//  UYC
//
//  Created by JubalThang on 3/6/18.
//  Copyright © 2018 United Youth. All rights reserved.
//


import UIKit
import WebKit

class LocationViewController: UIViewController, WKNavigationDelegate {
    
    let activityIndicator = UIActivityIndicatorView()
//    private let locationManager = CLLocationManager()
    
    let locationWebView: WKWebView = {
        let webView = WKWebView(frame: CGRect.zero, configuration: WKWebViewConfiguration())
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
//     private var locationWebView = GMSMapView()
//    //Create a MapView
//    let camera = GMSCameraPosition.camera(withLatitude: Location().latitude, longitude: Location().longtitude, zoom: 12)
//
    
    let backBtn: UIButton = {
        let button = HomeButton()
        button.addTarget(self, action: #selector(backToHome), for: .touchUpInside)
        return button
    }()
    
    
    let locationTitleContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .white
        container.layer.shadowOpacity = 0.25
        container.layer.shadowOffset = CGSize(width: 0, height: 3)
        return container
    }()
    
    var locationTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Location"
        label.font = UIFont.boldSystemFont(ofSize: 23)
        label.textAlignment = .center
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.backgroudnColor
//
//        locationManager.delegate = self
//        locationManager.requestAlwaysAuthorization()
//
        locationWebView.navigationDelegate = self
//        locationWebView = GMSMapView.map(withFrame: .zero, camera: camera)
//        locationWebView.settings.compassButton = true
//        locationWebView.settings.myLocationButton = true
//        locationWebView.settings.zoomGestures = true
//
//        // Creates a marker in the center of the map
//        let marker = GMSMarker()
//        marker.position = camera.target
//        marker.title = "Sydney"
//        marker.snippet = "Australia"
////        marker.appearAnimation = KGMSmarkerAnimationPop
//        marker.map = locationWebView
        [locationTitleContainer,locationTitleContainer,locationTitleLabel,backBtn,locationWebView].forEach{view.addSubview($0)}
        
        locationTitleContainer.anchor(top: view.safeAreaLayoutGuide.topAnchor, tailing: view.safeAreaLayoutGuide.trailingAnchor, bottom: nil, leading: view.safeAreaLayoutGuide.leadingAnchor,centerX: nil,centerY: nil)
        locationTitleContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125).isActive = true
        
        locationTitleLabel.anchor(top: locationTitleContainer.topAnchor, tailing: locationTitleContainer.trailingAnchor, bottom: locationTitleContainer.bottomAnchor, leading: locationTitleContainer.leadingAnchor, centerX: nil, centerY: nil)
        
        NSLayoutConstraint.activate([
            backBtn.centerYAnchor.constraint(equalTo: locationTitleContainer.centerYAnchor),
            backBtn.heightAnchor.constraint(equalTo: locationTitleContainer.heightAnchor, multiplier: 0.35),
            backBtn.widthAnchor.constraint(equalTo: locationTitleContainer.heightAnchor, multiplier: 0.35),
            backBtn.leadingAnchor.constraint(equalTo: locationTitleContainer.leadingAnchor, constant: 23)
            ])
        
        
        locationWebView.anchor(top: locationTitleContainer.bottomAnchor, tailing: locationTitleContainer.trailingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: locationTitleContainer.leadingAnchor, centerX: nil, centerY: nil,padding: .init(top: 16, left: 50, bottom: -50, right: -50))
        
        
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
    override func viewDidAppear(_ animated: Bool) {
        let url = URL(string: WebLinks().locationLink)
        locationWebView.load(URLRequest(url: url!))
    }
    
    
    @objc func backToHome(){
        BackToHome().backtoHome(from: self)
    }
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        guard status == .authorizedWhenInUse else{
//            return
//        }
//        locationManager.startUpdatingLocation()
//
//        locationWebView.isMyLocationEnabled = true
//    }
}


