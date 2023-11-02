//
//  BasicViewController.swift
//  FileManager
//
//  Created by 김건우 on 11/2/23.
//

import UIKit

class BasicViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let manager = FileManager.default
        let documents = manager.urls(for: .documentDirectory, in: .userDomainMask)
        let docURL = documents.first!
        print(" - 도큐먼트 URL: \(docURL)")
    }

}
