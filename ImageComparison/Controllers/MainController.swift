//
//  MainController.swift
//  ImageComparison
//
//  Created by Marcelo Sampaio on 28/12/18.
//  Copyright © 2018 Marcelo Sampaio. All rights reserved.
//

import UIKit

class MainController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: - Properties
    private var source = [String]()
    private var imagePicker: UIImagePickerController!
    
    // Enums
    enum ImageSource {
        case photoLibrary
        case camera
    }
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var refreshButton: UIBarButtonItem!
    @IBOutlet weak var actionButton: UIBarButtonItem!
    @IBOutlet weak var imageView: UIImageView!
    
    
    // MARK: - Vierw Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    // MARK: - UI Actions
    @IBAction func refreshAction(_ sender: Any) {
        hideImageInfo()
    }
    
    @IBAction func optionsAction(_ sender: Any) {
        showActionSheet()
    }
    
    // MARK: - Action Sheeet
    private func showActionSheet() {
        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .actionSheet)
        
        // actions definition
        let takePictureAction = UIAlertAction(title: "Take picture and compare", style: .default) { (action) in
            // completion
            self.takePicture()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            { (action) in
                // completion
            }
        
        // actions to the sheet
        optionMenu.addAction(takePictureAction)
        optionMenu.addAction(cancelAction)
        
        // present option menu
        self.present(optionMenu, animated: true, completion: nil)
        
    }
    
    
    // MARK: - Table View DataSource and Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return source.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = source[indexPath.row]
        return cell!
    }

    // MARK: - Image Helper
    private func takePicture() {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            selectImageFrom(.photoLibrary)
            return
        }
        selectImageFrom(.camera)
    }
    
    func selectImageFrom(_ source: ImageSource){
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        switch source {
        case .camera:
            imagePicker.sourceType = .camera
        case .photoLibrary:
            imagePicker.sourceType = .photoLibrary
        }
        present(imagePicker, animated: true, completion: nil)
    }

    
    // MARK: - Image Picker Delegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        
//        for (key, value) in info {
//            print("👉\(key.rawValue)  👉\(value)")
////            if key.rawValue == "UIImagePickerControllerOriginalImage" {
////                let thisImage = value as! UIImage
////                print("🔥 size: \(thisImage.size)  orientation: \(thisImage.imageOrientation.rawValue)")
////            }
//        }

        imagePicker.dismiss(animated: true, completion: nil)
        guard let selectedImage = info[.originalImage] as? UIImage else {
            print("❌ Image not found!")
            return
        }
    
        hideImageInfo()
        self.imageView.image = selectedImage
        showImageinfo()
        
    }
    
    // MARK: - Image Data Info Helper
    private func showImageinfo() {
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 240.0)
        source.append("🗓 Date: \(Date())")
        source.append("🙌 Width: \(String(describing: (imageView.image?.size.width)!))")
        source.append("🙌 Height: \(String(describing: (imageView.image?.size.height)!))")
        if imageView.image?.imageOrientation.rawValue == 0 {
            source.append("🚥 landscape orientation")
        }else{
            source.append("🚦 portrait orientation")
        }

        // image to Data
//        let imageData = UIImagePNGRepresentation(imageView.image!)
        let imageData = imageView.image!.pngData()
        source.append("💼 Data size: \(String(describing: (imageData?.count)!))")
        
        // size on disk
        _ = PersistenceManager.standard.addFile(id: "temp.dat", data: imageData! as NSData)
        let attributes = PersistenceManager.standard.getFileAttributes("temp.dat")
        let fileSize = attributes["NSFileSize"] as! Int
        source.append("💼 Disk size: \(String(describing: fileSize))")
        _ = PersistenceManager.standard.deleteFile("temp.dat")
        
        // base64
        let arquivoBase64 = convertImageToBase64(image: imageView.image!)
        source.append("💼 Base64 size: \(String(describing: arquivoBase64.count))")
        
        self.tableView.tableHeaderView = imageView
        tableView.reloadData()
        
    }
    private func hideImageInfo() {
        // refresh UIImage
        imageView.image = UIImage()
        // refresh table view
        source = [String]()
        tableView.tableHeaderView = nil
        tableView.reloadData()
        
    }
    
    // MARK: - Converter
    func convertImageToBase64(image: UIImage) -> String {
        
        let jpegCompressionQuality: CGFloat = 0.5
//        let imageData = UIImageJPEGRepresentation(image, jpegCompressionQuality)
        let imageData = image.jpegData(compressionQuality: jpegCompressionQuality)
        let base64String = imageData?.base64EncodedString()
        
        return base64String!
        
    }
    
}

