//
//  utilities.swift
//  UYC
//
//  Created by JubalThang on 6/8/18.
//  Copyright © 2018 unitedyouth. All rights reserved.
//

import UIKit

extension UIView{
    
    func anchor(top: NSLayoutYAxisAnchor?,tailing: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, centerX: NSLayoutXAxisAnchor?, centerY: NSLayoutYAxisAnchor? ,size: CGSize = .zero ,padding: UIEdgeInsets = .zero){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let t = top{
            topAnchor.constraint(equalTo: t, constant: padding.top).isActive = true
        }
        if let r = tailing{
            trailingAnchor.constraint(equalTo: r, constant: padding.right).isActive = true
        }
        if let b = bottom{
            bottomAnchor.constraint(equalTo: b, constant: padding.bottom).isActive = true
        }
        if let l = leading{
            leadingAnchor.constraint(equalTo: l, constant: padding.left).isActive = true
        }
        if let x = centerX{
            centerXAnchor.constraint(equalTo: x).isActive = true
        }
        if let y = centerY{
            centerYAnchor.constraint(equalTo: y).isActive = true
        }
    }
}
extension UIColor{
    static var backgroudnColor = UIColor(red: 214/255, green: 213/255, blue: 213/255, alpha: 1)
    static var buttonSelectedColor = UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1)
    static var tableCellSessionBgColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
}
