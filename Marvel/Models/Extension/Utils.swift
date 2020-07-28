//
//  Utils.swift
//  Marvel
//
//  Created by MIGUEL PEREZ SUBIAS on 27/07/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation
import UIKit


class Utils {
    
    class func generateAlertControllerLoading(title : String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)

        //create an activity indicator
        let indicator = UIActivityIndicatorView(frame: alert.view.bounds)
        
        indicator.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        //add the activity indicator as a subview of the alert controller's view
        alert.view.addSubview(indicator)
        indicator.isUserInteractionEnabled = false // required otherwise if there buttons in the UIAlertController you will not be able to press them
        indicator.startAnimating()
        
        let height:NSLayoutConstraint = NSLayoutConstraint(item: alert.view, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: alert.view.frame.height * 0.15)
        
        alert.view.addConstraint(height);
        
        return alert
    }
    
    class func generateAlertController(title : String, message : String)  -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        return alert
    }
    
    
}
