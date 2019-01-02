//
//  UIView+Utils.swift
//  ImageComparison
//
//  Created by Marcelo Sampaio on 02/01/19.
//  Copyright © 2019 Marcelo Sampaio. All rights reserved.
//

import UIKit

extension UIView {
    
    func showActivityLoading() {
        let shadowView = UIView(frame:CGRect(x: 0, y:0, width: 90, height:90))
        shadowView.center = self.center
        shadowView.layer.cornerRadius = 45
        shadowView.layer.masksToBounds = true
        
        shadowView.tag = -998;
        shadowView.backgroundColor = UIColor.black
        
        
        let activity = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
        activity.center = self.center
        activity.tag = -999
        
        UIApplication.shared.keyWindow?.rootViewController?.view.addSubview(shadowView)
        
        self.addSubview(shadowView)
        self.addSubview(activity)
        activity.startAnimating()
    }
    
    func hideActivityLoading() {
        self.alpha = 1.0
        self.viewWithTag(-998)?.removeFromSuperview()
        self.viewWithTag(-999)?.removeFromSuperview()
    }
    
}
