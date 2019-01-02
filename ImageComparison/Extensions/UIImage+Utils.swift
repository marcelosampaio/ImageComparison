//
//  UIImage+Utils.swift
//  ImageComparison
//
//  Created by Marcelo Sampaio on 02/01/19.
//  Copyright © 2019 Marcelo Sampaio. All rights reserved.
//
import UIKit

extension UIImage {
    
    // Resizes an input image (self) to a specified size
    func resizeToSize(size: CGSize!) -> UIImage? {
        // Begins an image context with the specified size
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0);
        // Draws the input image (self) in the specified size
        self.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        // Gets an UIImage from the image context
        let result = UIGraphicsGetImageFromCurrentImageContext()
        // Ends the image context
        UIGraphicsEndImageContext();
        // Returns the final image, or NULL on error
        return result;
    }
    
    
}
