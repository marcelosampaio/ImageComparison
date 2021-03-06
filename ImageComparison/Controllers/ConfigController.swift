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
    
    @IBAction func pngDataSizeAction(_ sender: Any) {
        AppSettings.standard.pngDataSize = pngDataSize.isOn
        if !pngDataSize.isOn {
            pngBase64Size.isOn = false
            AppSettings.standard.pngBase64Size = pngBase64Size.isOn
            pngDiskSize.isOn = false
            AppSettings.standard.pngDiskSize = pngDiskSize.isOn
        }
    }
    
    @IBAction func pngDiskSizeAction(_ sender: Any) {
        AppSettings.standard.pngDiskSize = pngDiskSize.isOn
        if pngDiskSize.isOn {
            pngDataSize.isOn = true
            AppSettings.standard.pngDataSize = pngDataSize.isOn
        }
    }
    
    @IBAction func pngBase64SizeAction(_ sender: Any) {
        AppSettings.standard.pngBase64Size = pngBase64Size.isOn
        if pngBase64Size.isOn {
            pngDataSize.isOn = true
            AppSettings.standard.pngDataSize = pngDataSize.isOn
        }
    }
    
    @IBAction func jpegDataSizeAction(_ sender: Any) {
        AppSettings.standard.jpegDataSize = jpegDataSize.isOn
        if !jpegDataSize.isOn {
            jpegBase64Size.isOn = false
            AppSettings.standard.jpegBase64Size = jpegBase64Size.isOn
            jpegDiskSize.isOn = false
            AppSettings.standard.jpegDiskSize = jpegDiskSize.isOn
        }
    }
    
    @IBAction func jpegDiskSizeAction(_ sender: Any) {
        AppSettings.standard.jpegDiskSize = jpegDiskSize.isOn
        if jpegDiskSize.isOn {
            jpegDataSize.isOn = true
            AppSettings.standard.jpegDataSize = jpegDataSize.isOn
        }
    }
    
    @IBAction func jpegBase64SizeAction(_ sender: Any) {
        AppSettings.standard.jpegBase64Size = jpegBase64Size.isOn
        if jpegBase64Size.isOn {
            jpegDataSize.isOn = true
            AppSettings.standard.jpegDataSize = jpegDataSize.isOn
        }
    }
    
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
