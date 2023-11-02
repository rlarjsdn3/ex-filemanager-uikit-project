//
//  CustomDirectoryViewController.swift
//  FileManager
//
//  Created by 김건우 on 11/2/23.
//

import UIKit

class CustomDirectoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let manager = FileManager.default
        let documents = manager.urls(for: .documentDirectory, in: .userDomainMask)
        let docURL = documents.first!
        
        let newFileURL = docURL.appending(path: "myfiles/anotherfile.txt")
        let path = newFileURL.path()
        let created = manager.createFile(atPath: path, contents: nil, attributes: nil)
        if !created {
            print("파일 생성 실패")
        }
    }

}
