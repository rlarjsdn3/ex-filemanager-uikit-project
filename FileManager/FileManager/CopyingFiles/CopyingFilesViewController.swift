//
//  CopyingFilesViewController.swift
//  FileManager
//
//  Created by 김건우 on 11/2/23.
//

import UIKit

class CopyingFilesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let manager = FileManager.default
        let documents = manager.urls(for: .documentDirectory, in: .userDomainMask)
        let docURL = documents.first!
        
        let originURL = docURL.appending(path: "myfiles/mytext.txt")
        let destinationURL = docURL.appending(path: "mytext.txt")
        let originPath = originURL.path()
        let destinationPath = destinationURL.path()
        do {
            try manager.copyItem(atPath: originPath, toPath: destinationPath)
        } catch {
            print("파일 복사 실패")
        }
    }

}
