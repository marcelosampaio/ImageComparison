//
//  MainController.swift
//  ImageComparison
//
//  Created by Marcelo Sampaio on 28/12/18.
//  Copyright © 2018 Marcelo Sampaio. All rights reserved.
//

import UIKit

class MainController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - Properties
    private var source = [String]()
    
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var refreshButton: UIBarButtonItem!
    @IBOutlet weak var actionButton: UIBarButtonItem!
    
    
    // MARK: - Vierw Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    // mARK: - Table View DataSource and Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return source.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = source[indexPath.row]
        return cell!
    }
    

}

