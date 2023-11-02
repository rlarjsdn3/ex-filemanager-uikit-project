//
//  BundleViewController.swift
//  FileManager
//
//  Created by 김건우 on 11/2/23.
//

import UIKit

class BundleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let bundle = Bundle.main
        let filePath = bundle.path(forResource: "posting", ofType: "md")
        
        let manager = FileManager.default
        if let data = manager.contents(atPath: filePath!) {
            let posting = String(data: data, encoding: .utf8)
            print(posting!)
        }
    }

}
