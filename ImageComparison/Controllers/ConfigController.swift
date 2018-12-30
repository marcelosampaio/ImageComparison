//
//  ConfigController.swift
//  ImageComparison
//
//  Created by Marcelo on 30/12/18.
//  Copyright © 2018 Marcelo Sampaio. All rights reserved.
//

import UIKit

class ConfigController: UITableViewController {

    // MARK: - Outlets
    @IBOutlet weak var pngDataSize: UISwitch!
    @IBOutlet weak var pngDiskSize: UISwitch!
    @IBOutlet weak var pngBase64Size: UISwitch!
    
    @IBOutlet weak var jpegDataSize: UISwitch!
    @IBOutlet weak var jpegDiskSize: UISwitch!
    @IBOutlet weak var jpegBase64Size: UISwitch!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        uiRefresh()

    }

    // MARK: - UI Actions
    
    // MARK: - UI Refresh
    private func uiRefresh() {
        pngDataSize.isOn = AppSettings.standard.pngDataSize
        pngDiskSize.isOn = AppSettings.standard.pngDiskSize
        pngBase64Size.isOn = AppSettings.standard.pngBase64Size
        
        jpegDataSize.isOn = AppSettings.standard.jpegDataSize
        jpegDiskSize.isOn = AppSettings.standard.jpegDiskSize
        jpegBase64Size.isOn = AppSettings.standard.jpegBase64Size
    }
}
