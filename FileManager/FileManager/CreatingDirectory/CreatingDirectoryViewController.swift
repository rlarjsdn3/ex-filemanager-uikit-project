//
//  CreatingDirectoryViewController.swift
//  FileManager
//
//  Created by 김건우 on 11/2/23.
//

import UIKit

class CreatingDirectoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let manager = FileManager.default
        let documents = manager.urls(for: .documentDirectory, in: .userDomainMask)
        let docURL = documents.first!
        
        let newDirectoryURL = docURL.appending(path: "myfiles")
        let path = newDirectoryURL.path()
        do {
            try manager.createDirectory(atPath: path, withIntermediateDirectories: false, attributes: nil)
        } catch {
            print("디렉토리 생성 실패")
        }
    }

}
