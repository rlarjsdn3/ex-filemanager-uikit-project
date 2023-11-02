//
//  ContentsViewController.swift
//  FileManager
//
//  Created by 김건우 on 11/2/23.
//

import UIKit

class ContentsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let manager = FileManager.default
        let documents = manager.urls(for: .documentDirectory, in: .userDomainMask)
        let docURL = documents.first!
        listOfItem(directory: docURL)
    }
    
    func listOfItem(directory: URL) {
        let manager = FileManager.default
        if let list = try? manager.contentsOfDirectory(atPath: directory.path()) {
            if list.isEmpty {
                print("The directory is empty")
            } else {
                for item in list {
                    print(item)
                }
            }
        }
    }

}
