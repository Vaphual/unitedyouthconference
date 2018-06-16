//
//  LocationMapViewController.swift
//  UYC
//
//  Created by JubalThang on 6/11/18.
//  Copyright © 2018 unitedyouth. All rights reserved.
//

import UIKit
import MapKit

class LocationMapViewController: UIViewController, MKMapViewDelegate {
    let activityIndicator = UIActivityIndicatorView()
    
    let backBtn: UIButton = {
        let button = HomeButton()
        button.addTarget(self, action: #selector(backToHome), for: .touchUpInside)
        return button
    }()
    
    
    let location = Location()
    
    let locationMap : MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        map.showsCompass = true
        map.mapType = .standard
        map.showsScale = false
        return map
    }()
    
    let addressTextView: UILabel = {
        let address = UILabel()
        address.translatesAutoresizingMaskIntoConstraints = false
        address.numberOfLines = 0
        return address
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
    
    let addressContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .white
        container.layer.shadowOpacity = 0.5
        container.layer.shadowOffset = CGSize(width: 0, height: 3)
        //        container.layer.cornerRadius = 15
        
        return container
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.backgroudnColor
        /// Map ///
        
        locationMap.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        let churchCoordiante = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longtitude)
        let churchAnnotation = LocationChurch(coordiante: churchCoordiante, title: "STBC", subtitle: "ပြဲက်င္းပရာေနရာ")
        
        locationMap.addAnnotation(churchAnnotation)
        
        locationMap.setRegion(churchAnnotation.region, animated: true)
        locationMap.showsCompass = true
        locationMap.showsScale = false
        
        //// Map End ///
        
        //// Address -------------------------
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        paragraphStyle.alignment = .center
        
        let hostChurch = NSMutableAttributedString(string: "Address: \n", attributes: [NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: 15), NSAttributedStringKey.paragraphStyle : paragraphStyle, NSAttributedStringKey.underlineColor : UIColor.black ,NSAttributedStringKey.underlineStyle : 1])
        
        hostChurch.append(NSAttributedString(string: location.host_church, attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 14), NSAttributedStringKey.paragraphStyle : paragraphStyle]))
        
        hostChurch.append(NSAttributedString(string: "\n" + location.host_address, attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14),NSAttributedStringKey.paragraphStyle : paragraphStyle]))
        
        addressTextView.attributedText = hostChurch
        ///----------------------- Address end
        
        [locationTitleContainer,locationTitleContainer,locationTitleLabel,backBtn,addressContainer,addressTextView,locationMap].forEach{view.addSubview($0)}
        
        
        locationTitleContainer.anchor(top: view.safeAreaLayoutGuide.topAnchor, tailing: view.safeAreaLayoutGuide.trailingAnchor, bottom: nil, leading: view.safeAreaLayoutGuide.leadingAnchor,centerX: nil,centerY: nil)
        locationTitleContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125).isActive = true
        
        locationTitleLabel.anchor(top: locationTitleContainer.topAnchor, tailing: locationTitleContainer.trailingAnchor, bottom: locationTitleContainer.bottomAnchor, leading: locationTitleContainer.leadingAnchor, centerX: nil, centerY: nil)
        
        addressContainer.anchor(top: locationTitleContainer.bottomAnchor, tailing: view.safeAreaLayoutGuide.trailingAnchor, bottom: nil, leading: view.safeAreaLayoutGuide.leadingAnchor, centerX: view.centerXAnchor,centerY: nil,padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))
        addressContainer.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        addressTextView.anchor(top: addressContainer.topAnchor, tailing: addressContainer.trailingAnchor, bottom: addressContainer.bottomAnchor, leading: addressContainer.leadingAnchor, centerX: nil, centerY: nil, size: CGSize.zero, padding: UIEdgeInsets(top: 8, left: 8, bottom: -8, right: -8))
        
        NSLayoutConstraint.activate([
            backBtn.centerYAnchor.constraint(equalTo: locationTitleContainer.centerYAnchor),
            backBtn.heightAnchor.constraint(equalTo: locationTitleContainer.heightAnchor, multiplier: 0.35),
            backBtn.widthAnchor.constraint(equalTo: locationTitleContainer.heightAnchor, multiplier: 0.35),
            backBtn.leadingAnchor.constraint(equalTo: locationTitleContainer.leadingAnchor, constant: 23)
            ])
        locationMap.anchor(top: addressContainer.bottomAnchor, tailing: view.safeAreaLayoutGuide.trailingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, centerX: nil, centerY: nil, size: .zero, padding: .init(top: 10, left: 10, bottom: -10, right: -10))
    }
    
    @objc func backToHome(){
        BackToHome().backtoHome(from: self)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let churchAnnotation = locationMap.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) as? MKMarkerAnnotationView{
            churchAnnotation.animatesWhenAdded = true
            churchAnnotation.titleVisibility = .adaptive
            return churchAnnotation
        }
        return nil
    }
}

final class LocationChurch: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title : String?
    var subtitle: String?
    
    init(coordiante: CLLocationCoordinate2D, title: String?, subtitle: String?){
        self.coordinate = coordiante
        self.title = title
        self.subtitle = subtitle
        
        super.init()
    }
    var region: MKCoordinateRegion {
        let span = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
        return MKCoordinateRegion(center: coordinate, span: span)
    }
}
