//
//  AppSettings.swift
//  ImageComparison
//
//  Created by Marcelo on 30/12/18.
//  Copyright © 2018 Marcelo Sampaio. All rights reserved.
//

import Foundation

private let sharedInstance = AppSettings()

class AppSettings {
    
    
    // MARK: - Config Values
    // PNG
    public var pngDataSize = Bool()
    public var pngDataSizeElapsedTime = Bool()
    
    public var pngDiskSize = Bool()
    public var pngDiskSizeElapsedTime = Bool()
    
    public var pngBase64Size = Bool()
    public var pngBase64SizeElapsedTime = Bool()

    // JPEG
    public var jpegDataSize = Bool()
    public var jpegDataSizeElapsedTime = Bool()
    
    public var jpegDiskSize = Bool()
    public var jpegDiskSizeElapsedTime = Bool()
    
    public var jpegBase64Size = Bool()
    public var jpegBase64SizeElapsedTime = Bool()

    
    // MARK: - 
    class var standard: AppSettings {
        return sharedInstance
    }
    

    
    
}
