//
//  RemovingFilesViewController.swift
//  FileManager
//
//  Created by 김건우 on 11/2/23.
//

import UIKit

class RemovingFilesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let manager = FileManager.default
        let documents = manager.urls(for: .documentDirectory, in: .userDomainMask)
        let docURL = documents.first!
        
        let fileURL = docURL.appending(path: "myfiles/mytext.txt")
        let path = fileURL.path()
        do {
            try manager.removeItem(atPath: path)
        } catch {
            print("파일 삭제 실패")
        }
    }

}
