//
//  CreatingFilesViewController.swift
//  FileManager
//
//  Created by 김건우 on 11/2/23.
//

import UIKit

class CreatingFilesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let manager = FileManager.default
        let documents = manager.urls(for: .documentDirectory, in: .userDomainMask)
        let docURL = documents.first!
        
        let newFileURL = docURL.appending(path: "mytext.txt")
        let path = newFileURL.path()
        manager.createFile(atPath: path, contents: nil, attributes: nil)
    }

}
