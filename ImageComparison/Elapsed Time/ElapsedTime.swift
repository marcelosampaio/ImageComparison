//
//  ElapsedTime.swift
//  ImageComparison
//
//  Created by Marcelo on 30/12/18.
//  Copyright © 2018 Marcelo Sampaio. All rights reserved.
//

import CoreFoundation

class ElapsedTime {
    
    let startTime : CFAbsoluteTime
    var endTime : CFAbsoluteTime?
    
    init() {
        startTime = CFAbsoluteTimeGetCurrent()
    }
    
    func stop() -> CFAbsoluteTime {
        endTime = CFAbsoluteTimeGetCurrent()
        
        return duration!
    }
    
    var duration:CFAbsoluteTime? {
        if let endTime = endTime {
            return endTime - startTime
        } else {
            return nil
        }
    }
}

